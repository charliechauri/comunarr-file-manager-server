'use strict';

const db = require(`${global.__base}/src/middleware/db`);
const statusMessage = require(`${global.__base}/src/utils/request-status-message`);
const authInfo = require(`${global.__base}/src/utils/auth-information`);
const del = require('del');
const copyFile = require('quickly-copy-file');
const constants = require(`${global.__base}/src/config/constants`);

module.exports = {
    GET: (request, reply) => {
        const params = request.query;
        params.uploadedByMe = params.uploadedByMe === true ? 1 : 0;

        db.getConnection((err, connection) => {
            connection.query('CALL file_selectSimpleSearch(?, ?, ?, ?, ?, ?, ?)', [params.name, params.author, params.idComunarrProject, params.idCollective, params.idGeneralTopic, params.uploadedByMe, authInfo.GET_USER_ID(request)], (error, results, fields) => {
                connection.release();

                if (error) throw error;

                if (results.fieldCount === 0) {
                    reply(statusMessage.NOT_FOUND);
                } else {
                    let resultsSet = results.slice(0, -1);
                    let arrLen = resultsSet.length;
                    let arrFile = [];

                    for (let index = 0; index < arrLen; index++) {
                        let file = resultsSet[index][0];
                        index++;
                        file.idKeyWord = resultsSet[index].map(item => item.idKeyWord);

                        arrFile.push(file);
                    }

                    reply(arrFile);
                }
            });
        });
    },

    POST: (request, reply) => {
        let file = request.payload;

        prepareFile(file, reply, (file, newFileName) => {
            db.getConnection((err, connection) => {
                connection.query('CALL file_insert(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [file.name, file.author, file.place, file.relatedDate, file.idCollective, file.idComunarrProject, file.idGeneralTopic, file.idSpecificTopic, file.idPrivacyType, file.idContentType, file.fileType, authInfo.GET_USER_ID(request), file.timestamp, file.keyWords], (error, results, fields) => {
                    connection.release();

                    if (error) {
                        deleteFile(newFileName).catch(error => { throw error; });
                        throw error;
                    }

                    if (results[0][0].SUCCESS === 0) {
                        deleteFile(newFileName).catch(error => { throw error; });
                        reply(statusMessage.BAD_REQUEST);
                    }
                    else {
                        const item = results[0][0];
                        item.idKeyWord = results[1].map(elem => elem.idKeyWord);
                        reply({ message: statusMessage.OK, item });
                    }
                });
            });
        });

    },

    PUT: (request, reply) => {
        let file = request.payload;

        prepareFile(file, reply, (file, newFileName) => {
            db.getConnection((err, connection) => {
                connection.query('CALL file_update(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [file.id, file.name, file.author, file.place, file.relatedDate, file.idCollective, file.idComunarrProject, file.idGeneralTopic, file.idSpecificTopic, file.idPrivacyType, file.idContentType, file.fileType, authInfo.GET_USER_ID(request), file.timestamp, file.keyWord], (error, results, fields) => {
                    connection.release();

                    if (error) throw error;

                    if (results[0][0].SUCCESS === 0) {
                        deleteFile(newFileName).catch(error => { throw error; });
                        reply(statusMessage.BAD_REQUEST);
                    }
                    else {
                        const oldFileInfo = results[0][0];
                        const item = results[1][0];
                        item.idKeyWord = results[2].map(elem => elem.idKeyWord);

                        // Delete old file
                        deleteFile(`${global.__base}/${constants.directories.files}/${oldFileInfo.timestamp}.${oldFileInfo.fileType}`).catch(error => { throw error; });
        
                        reply({ message: statusMessage.OK, item });
                    }

                });
            });
        });
    },

    DELETE: (request, reply) => {
        let id = encodeURIComponent(request.params.id);

        db.getConnection((err, connection) => {
            connection.query('CALL file_delete(?, ?)', [id, authInfo.GET_USER_ID(request)], (error, results, fields) => {
                connection.release();

                if (error) throw error;

                if (results[0][0].SUCCESS === 0) {
                    reply(statusMessage.BAD_REQUEST);
                }
                else {
                    const deletedFileInfo = results[0][0];
                    // Delete file
                    deleteFile(`${global.__base}/${constants.directories.files}/${deletedFileInfo.timestamp}.${deletedFileInfo.fileType}`).catch(error => { throw error; });

                    const item = results[1][0];
                    reply({ message : statusMessage.OK, item });
                }

            });
        });
    },

    POST_SPECIFIC_SEARCH: (request, reply) => {
        let specificSearch = request.payload;
        let filters = generateQuery(specificSearch);

        db.getConnection((err, connection) => {
            connection.query('CALL file_selectSpecificSearch(?, ?)', [filters, authInfo.GET_USER_ID(request)], (error, results, fields) => {
                connection.release();

                if (results.fieldCount === 0)
                    reply(statusMessage.NOT_FOUND);
                else {
                    let resultsSet = results.slice(0, -1);
                    let arrLen = resultsSet.length;
                    let arrFile = [];

                    for (let index = 0; index < arrLen; index++) {
                        let file = resultsSet[index][0];
                        index++;
                        file.idKeyWord = resultsSet[index].map(item => item.idKeyWord);

                        arrFile.push(file);
                    }

                    reply(arrFile);
                }

            });
        });
    }
};

const generateQuery = obj => {
    let arrFilters = [];
    let filters = '';

    // File name filter
    if (obj.name) { arrFilters.push(`name LIKE "%${obj.name}%" `); }

    // Author filter
    if (obj.author.OR.length > 0) { arrFilters.push(formatORStringFilters('author', obj.author.OR)); }
    if (obj.author.NOT.length > 0) { arrFilters.push(formatNOTStringFilters('author', obj.author.NOT)); }

    // Place filter
    if (obj.place.OR.length > 0) { arrFilters.push(formatORStringFilters('place', obj.place.OR)); }
    if (obj.place.NOT.length > 0) { arrFilters.push(formatNOTStringFilters('place', obj.place.NOT)); }

    // Id filters
    let integerFilterNames = Object.keys(obj).filter(name => { return name.startsWith('id'); });

    for (let filter of integerFilterNames) {
        if (obj[filter].OR.length > 0) { arrFilters.push(formatORIntegerFilters(filter, obj[filter].OR)); }
        if (obj[filter].NOT.length > 0) { arrFilters.push(formatNOTIntegerFilters(filter, obj[filter].NOT)); }
    };

    // RelatedDate filter
    arrFilters.push(('(relatedDate IS NULL OR ').concat(formatDateFilters('relatedDate', obj.relatedDate)).concat(')'));

    // UpdateDate filter
    arrFilters.push(formatDateFilters('updateDate', obj.updateDate));

    // Key words filter
    if (obj.keyWords.OR.length > 0) { arrFilters.push(formatKeyWordORFilters(obj.keyWords.OR)); }
    if (obj.keyWords.AND.length > 0) { arrFilters.push(formatKeyWordANDFilters(obj.keyWords.AND)); }
    if (obj.keyWords.NOT.length > 0) { arrFilters.push(formatKeyWordNOTFilters(obj.keyWords.NOT)); }

    return filters.concat(arrFilters.join(' AND '));
};

const formatORStringFilters = (param, array) => array.map(item => `${param} LIKE "%${item}%"`).join(' OR ');

const formatNOTStringFilters = (param, array) => array.map(item => `${param} NOT LIKE "%${item}%"`).join(' AND ');

const formatORIntegerFilters = (param, array) => `${param} IN (`.concat(array.join(',')).concat(')');

const formatNOTIntegerFilters = (param, array) => `${param} NOT IN (`.concat(array.join(',')).concat(')');

const formatDateFilters = (param, array) => `${param} BETWEEN "${array[0]}" AND "${array[1]}"`;

const formatKeyWordORFilters = array => {
    return '('.concat(array.map(item => `EXISTS (SELECT * FROM comunarr.keyWord_file WHERE idFile = id AND idKeyWord = ${item})`).join(' OR ')).concat(')');
};

const formatKeyWordNOTFilters = array => {
    return array.map(item => `NOT EXISTS (SELECT * FROM comunarr.keyWord_file WHERE idFile = id AND idKeyWord = ${item})`).join(' AND ');
};

const formatKeyWordANDFilters = array => {
    return array.map(item => `EXISTS (SELECT * FROM comunarr.keyWord_file WHERE idFile = id AND idKeyWord = ${item})`).join(' AND ');
};

const prepareFile = (file, reply, connectToDatabase) => {
    // Set additional/optinal file object information
    file.timestamp = getTimestamp();
    file.keyWords = formatKeyWords(file);
    file = fillOptionalFields(file);
    file.fileType = getFileExtension(file.file.filename);

    if (file.fileType === null || file.fileType === 'exe') {
        reply(statusMessage.BAD_REQUEST);
        return;
    }

    saveFile(file, connectToDatabase);
};

const saveFile = (file, connectToDatabase) => {
    // Define file name
    let newFileName = `${global.__base}/${constants.directories.files}/${file.timestamp}.${file.fileType}`;

    // Save file
    copyFile(file.file.path, newFileName)
        .then(() => {
            // Delete temp file
            deleteFile(file.file.path).catch(error => { throw error; });
            connectToDatabase(file, newFileName);
        })
        .catch(error => {
            if (error) {
                deleteFile(file.file.path).catch(error => { throw error; });
                throw error;
            }
        });
};

const deleteFile = fileName => del([fileName]).then(paths => paths);

const getTimestamp = () => (+new Date).toString();

const formatKeyWords = file => ('keyWords' in file) ? file.keyWords.join(',') : null;

const fillOptionalFields = file => {
    ['place', 'relatedDate', 'idSpecificTopic'].forEach(key => {
        file[key] = file[key] === undefined ? null : file[key];
    });
    return file;
};

const getFileExtension = filename => {
    let extension = filename.split('.');
    return (extension.length < 2 ? null : extension.pop().toLowerCase());
};
