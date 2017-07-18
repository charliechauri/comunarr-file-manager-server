'use strict';

const db = require(`${global.__base}/src/middleware/db`);
const statusMessage = require(`${global.__base}/src/utils/request-status-message`);

module.exports = {
    GET: (request, reply) => {
        const params = request.query;

        db.getConnection((err, connection) => {
            connection.query('CALL file_selectSimpleSearch(?, ?, ?, ?, ?, ?, ?)', [params.name, params.author, params.idComunarrProject, params.idCollective, params.idGeneralTopic, params.uploadedByMe, 1], (error, results, fields) => { // @todo define user ID
                connection.release();

                if (error) throw error;

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
    },

    POST: (request, reply) => {
        let file = request.payload;

        file.keyWord = file.keyWord.join(',');
        file.timestamp = (+new Date).toString();

        db.getConnection((err, connection) => {
            connection.query('CALL file_insert(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [file.name, file.author, file.place, file.relatedDate, file.idCollective, file.idComunarrProject, file.idGeneralTopic, file.idSpecificTopic, file.idPrivacyType, file.idContentType, file.fileType, 1, file.timestamp, file.keyWord], (error, results, fields) => { // @todo define user ID
                connection.release();

                if (error) throw error;

                if (results[0][0].SUCCESS === 0) {
                    reply(statusMessage.BAD_REQUEST);
                }
                else {
                    let resultFile = results[0][0];
                    resultFile.idKeyWord = results[1].map(item => item.idKeyWord);

                    reply(resultFile);
                }

            });
        });
    },

    PUT: (request, reply) => {
        let file = request.payload;

        file.keyWord = file.keyWord.join(',');
        file.timestamp = (+new Date).toString();

        db.getConnection((err, connection) => {
            connection.query('CALL file_update(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [file.id, file.name, file.author, file.place, file.relatedDate, file.idCollective, file.idComunarrProject, file.idGeneralTopic, file.idSpecificTopic, file.idPrivacyType, file.idContentType, file.fileType, 1, file.timestamp, file.keyWord], (error, results, fields) => { // @todo define user ID
                connection.release();

                if (error) throw error;

                if (results[0][0].SUCCESS === 0) {
                    reply(statusMessage.BAD_REQUEST);
                }
                else {
                    let resultFile = results[0][0];
                    resultFile.idKeyWord = results[1].map(item => item.idKeyWord);
                    reply(resultFile);
                }

            });
        });
    },

    DELETE: (request, reply) => {
        let id = encodeURIComponent(request.params.id);

        db.getConnection((err, connection) => {
            connection.query('CALL file_delete(?, ?)', [id, 1], (error, results, fields) => { // @todo define user ID
                connection.release();

                if (error) throw error;

                if (results[0][0].SUCCESS === 0) {
                    reply(statusMessage.BAD_REQUEST);
                }
                else {
                    reply(results[0][0]);
                }

            });
        });
    },

    POST_SPECIFIC: (request, reply) => { // @todo: Change name
        let specificSearch = request.payload;
        let query = generateQuery(specificSearch);

        db.getConnection((err, connection) => {
            connection.query(query, [], (error, results, fields) => { // @todo define user ID
                connection.release();

                if (error) throw error;

                if (results.length === 0) {
                    reply(statusMessage.NOT_FOUND);
                }
                else {
                    reply(results);
                }

            });
        });
    }
};

const generateQuery = obj => {
    let filters = [];

    let query = 'SELECT * FROM comunarr.file WHERE ';

    // File name filter
    query = obj.name === null? query : query.concat(`name LIKE "%${obj.name}%" `);

    // Author filter
    if (obj.author.OR.length > 0) { filters.push(formatORStringFilters('author', obj.author.OR)); }
    if (obj.author.NOT.length > 0) { filters.push(formatNOTStringFilters('author', obj.author.NOT)); }

    // Place filter
    if (obj.place.OR.length > 0) { filters.push(formatORStringFilters('place', obj.place.OR)); }
    if (obj.place.NOT.length > 0) { filters.push(formatNOTStringFilters('place', obj.place.NOT)); }

    // Id filters
    let integerFilterNames = Object.keys(obj).filter(name => {
        return name.startsWith('id');
    });

    for (let filter of integerFilterNames){
        if (obj[filter].OR.length > 0) { filters.push(formatORIntegerFilters(filter, obj[filter].OR)); }
        if (obj[filter].NOT.length > 0) { filters.push(formatNOTIntegerFilters(filter, obj[filter].NOT)); }
    };

    // RelatedDate filter
    filters.push(('(relatedDate IS NULL OR ').concat(formatDateFilters('relatedDate', obj.relatedDate)).concat(')'));

    // UpdateDate filter
    filters.push(formatDateFilters('updateDate', obj.updateDate));

    // Key words filter
    if (obj.keyWords.OR.length > 0) { filters.push(formatKeyWordORFilters(obj.keyWords.OR)); }
    if (obj.keyWords.AND.length > 0) { filters.push(formatKeyWordANDFilters(obj.keyWords.OR)); }
    if (obj.keyWords.NOT.length > 0) { filters.push(formatKeyWordNOTFilters(obj.keyWords.OR)); }


    return query.concat(filters.join(' AND '));
};

const formatORStringFilters = (param, array) => {
    return array.map(item => `${param} LIKE "%${item}%"`).join(' OR ');
};

const formatNOTStringFilters = (param, array) => {
    return array.map(item => `${param} NOT LIKE "%${item}%"`).join(' AND ');
};

const formatORIntegerFilters = (param, array) => {
    return (`${param} IN (`.concat(array.join(',')).concat(')'));
};

const formatNOTIntegerFilters = (param, array) => {
    return (`${param} NOT IN (`.concat(array.join(',')).concat(')'));
};

const formatDateFilters = (param, array) => {
    return (`${param} BETWEEN "${array[0]}" AND "${array[1]}"`);
};

const formatKeyWordORFilters = array => {
    return '('.concat(array.map(item => `EXISTS (SELECT * FROM comunarr.keyWord_file WHERE idFile = id AND idKeyWord = ${item})`).join(' OR ')).concat(')');
};

const formatKeyWordNOTFilters = array => {
    return array.map(item => `NOT EXISTS (SELECT * FROM comunarr.keyWord_file WHERE idFile = id AND idKeyWord = ${item})`).join(' AND ');
};

const formatKeyWordANDFilters = array => {
    return array.map(item => `EXISTS (SELECT * FROM comunarr.keyWord_file WHERE idFile = id AND idKeyWord = ${item})`).join(' AND ');
};


