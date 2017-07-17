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

                    for(let index= 0; index < arrLen; index++){
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
    }
};
