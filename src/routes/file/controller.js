'use strict';

const db = require(`${global.__base}/src/middleware/db`);
const statusMessage = require(`${global.__base}/src/utils/request-status-message`);
const authInfo = require(`${global.__base}/src/utils/auth-information`);
const fileUtility = require(`${global.__base}/src/utils/file.utility.js`);
const constants = require(`${global.__base}/src/config/constants`);

module.exports = {
    GET: (request, reply) => {
        const params = request.query;
        params.uploadedByMe = params.uploadedByMe === true ? 1 : 0;

        db.getConnection((err, connection) => {
            connection.query('CALL file_selectSimpleSearch(?, ?, ?, ?, ?, ?, ?)', [params.name, params.author, params.idComunarrProject, params.idCollective, params.idGeneralTopic, params.uploadedByMe, authInfo.GET_USER_ID(request)], (error, results) => {
                connection.release();

                if (error) throw error;

                if (results.fieldCount === 0) {
                    reply(statusMessage.NOT_FOUND);
                } else {
                    let resultsSet = results.slice(0, -1),
                        arrLen = resultsSet.length,
                        arrFile = [];

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

        fileUtility.checkSpace(file.file.bytes).then(result => {
            if (!result.isEnoughSpace) {  
                reply(statusMessage.INSUFFICIENT_STORAGE); 
                return;
            }
            fileUtility.prepareFile(file, reply, (file, newFileName) => {
                db.getConnection((err, connection) => {
                    connection.query('CALL file_insert(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [file.name, file.author, file.place, file.relatedDate, file.idCollective, file.idComunarrProject, file.idGeneralTopic, file.idSpecificTopic, file.idPrivacyType, file.idContentType, file.fileType, authInfo.GET_USER_ID(request), file.timestamp, file.keyWords, file.size], (error, results, fields) => {
                        connection.release();
    
                        if (error) {
                            fileUtility.deleteFile(newFileName).catch(error => { throw error; });
                            throw error;
                        }
    
                        if (results[0][0].SUCCESS === 0) {
                            fileUtility.deleteFile(newFileName).catch(error => { throw error; });
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
        });
    },

    PUT: (request, reply) => {
        let file = request.payload; 
        // If the file is not being updated, function parameter "size" is zero to omit the space validation
        fileUtility.checkSpace(file.file ? file.file.bytes : 0).then(result => {
            if (!result.isEnoughSpace) {  
                reply(statusMessage.INSUFFICIENT_STORAGE); 
                return;
            }
            fileUtility.prepareFile(file, reply, (file, newFileName) => {
                db.getConnection((err, connection) => {
                    connection.query('CALL file_update(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [file.id, file.name, file.author, file.place, file.relatedDate, file.idCollective, file.idComunarrProject, file.idGeneralTopic, file.idSpecificTopic, file.idPrivacyType, file.idContentType, file.fileType, authInfo.GET_USER_ID(request), file.timestamp, file.keyWords, file.size], (error, results, fields) => {
                        connection.release();

                        if (error) throw error;

                        if (results[0][0].SUCCESS === 0) {
                            if (file.file) {
                                fileUtility.deleteFile(newFileName).catch(error => { throw error; });
                            }
                            reply(statusMessage.BAD_REQUEST);
                        }
                        else {
                            const item = results[1][0];
                            item.idKeyWord = results[2].map(elem => elem.idKeyWord);

                            // Delete old file
                            const oldFileInfo = results[0][0];
                            if (file.file) {
                                fileUtility.deleteFile(`${global.__base}/${constants.directories.files}/${oldFileInfo.timestamp}.${oldFileInfo.fileType}`).catch(error => { throw error; });
                            }

                            reply({ message: statusMessage.OK, item });
                        }

                    });
                });
            }, 1); // Indicates that the file is been updated
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
                    fileUtility.deleteFile(`${global.__base}/${constants.directories.files}/${deletedFileInfo.timestamp}.${deletedFileInfo.fileType}`).catch(error => { throw error; });

                    const item = results[1][0];
                    reply({ message: statusMessage.OK, item });
                }

            });
        });
    },

    POST_SPECIFIC_SEARCH: (request, reply) => {
        let specificSearch = request.payload;
        let filters = fileUtility.generateQuery(specificSearch);

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
    },

    GET_FILE: (request, reply) => {
        let id = encodeURIComponent(request.params.id);

        db.getConnection((err, connection) => {
            const query = `SELECT F.name AS fileName, F.timestamp, FT.name AS fileType
                                    FROM comunarr.file AS F 
                                    INNER JOIN comunarr.fileType AS FT ON F.idFileType = FT.Id
                                    WHERE F.id = ${connection.escape(id)}`;

            connection.query(query, {}, (error, results) => {
                if (error) throw error;

                if (results.length === 0) {
                    reply({ message: statusMessage.NOT_FOUND });
                } else {
                    const fileName = `${global.__base}/${constants.directories.files}/${results[0].timestamp}.${results[0].fileType}`;

                    reply
                        .file(fileName, { filename: `${results[0].fileName}.${results[0].fileType}`, mode: 'attachment' })
                        .header('Access-Control-Expose-Headers', 'X-filename, content-disposition')
                        .header('X-filename', `${results[0].fileName}.${results[0].fileType}`);
                }

            });
        });
    }
};
