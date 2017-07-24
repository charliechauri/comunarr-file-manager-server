'use strict';

const db = require(`${global.__base}/src/middleware/db`);
const statusMessage = require(`${global.__base}/src/utils/request-status-message`);
const authInfo = require(`${global.__base}/src/utils/auth-information`);

module.exports = {
    GET: (request, reply) => {
        db.getConnection((err, connection) => {
            connection.query('CALL specificTopic_select', {}, (error, results, fields) => {
                connection.release();

                if (error) throw error;

                if (results.fieldCount === 0) { reply(statusMessage.NOT_FOUND); }
                else { reply(results[0]); }
                    
            });
        });
    },

    POST: (request, reply) => {
        let specificTopic = request.payload;

        specificTopic.idGeneralTopic = specificTopic.idGeneralTopic.join(',');

        db.getConnection((err, connection) => {
            connection.query('CALL specificTopic_insert(?, ?, ?)', [specificTopic.name, specificTopic.idGeneralTopic, authInfo.GET_USER_ID(request)], (error, results, fields) => { 
                connection.release();
                
                if (error) throw error;

                if (results[0][0].SUCCESS === 0) {
                    reply(statusMessage.BAD_REQUEST);
                }
                else {
                    let resultSpecificTopic = results[0][0];
                    resultSpecificTopic.idGeneralTopic = results[1].map(item => item.idGeneralTopic);

                    reply(resultSpecificTopic);
                }

            });
        });
    },

    PUT: (request, reply) => {
        let specificTopic = request.payload;

        specificTopic.idGeneralTopic = specificTopic.idGeneralTopic.join(',');

        db.getConnection((err, connection) => {
            connection.query('CALL specificTopic_update(?, ?, ?, ?, ?)', [specificTopic.id, specificTopic.name, specificTopic.idGeneralTopic, specificTopic.status, authInfo.GET_USER_ID(request)], (error, results, fields) => { 
                connection.release();
                
                if (error) throw error;

                if (results[0][0].SUCCESS === 0) {
                    reply(statusMessage.BAD_REQUEST);
                }
                else {
                    let resultSpecificTopic = results[0][0];
                    resultSpecificTopic.idGeneralTopic = results[1].map(item => item.idGeneralTopic);

                    reply(resultSpecificTopic);
                }

            });
        });
    }
};
