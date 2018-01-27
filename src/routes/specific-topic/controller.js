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

                if (results[0].length === 0) { reply(statusMessage.NOT_FOUND); }
                else {
                    let specificTopic = results[0];
                    specificTopic.forEach(item => item.status = !!item.status);
                    reply(specificTopic);
                }
                    
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
                    let item = results[0][0];
                    item.idGeneralTopic = results[1].map(elem => elem.idGeneralTopic);
                    item.status = !!item.status;
                    reply({ message: statusMessage.OK, item });
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
                    let item = results[0][0];
                    item.idGeneralTopic = results[1].map(elem => elem.idGeneralTopic);
                    item.status = !!item.status;
                    reply({ message: statusMessage.OK, item });
                }

            });
        });
    }
};
