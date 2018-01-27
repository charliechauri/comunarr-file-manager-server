'use strict';

const db = require(`${global.__base}/src/middleware/db`);
const statusMessage = require(`${global.__base}/src/utils/request-status-message`);
const authInfo = require(`${global.__base}/src/utils/auth-information`);

module.exports = {
    GET: (request, reply) => {
        db.getConnection((err, connection) => {
            connection.query('CALL generalTopic_select', {}, (error, results, fields) => {
                connection.release();

                if (error) throw error;

                if (results[0].length === 0) { reply(statusMessage.NOT_FOUND); }
                else {
                    let generalTopic = results[0];
                    generalTopic.forEach(item => item.status = !!item.status);
                    reply(generalTopic);
                }

            });
        });
    },

    POST: (request, reply) => {
        let generalTopic = request.payload;

        db.getConnection((err, connection) => {
            connection.query('CALL generalTopic_insert(?, ?)', [generalTopic.name, authInfo.GET_USER_ID(request)], (error, results, fields) => {
                connection.release();

                if (error) throw error;

                if (results[0][0].SUCCESS === 0) { reply(statusMessage.BAD_REQUEST); }
                else {
                    let item = results[0][0];
                    item.status = !!item.status;
                    reply({ message: statusMessage.OK, item });
                }

            });
        });
    },

    PUT: (request, reply) => {
        let generalTopic = request.payload;

        db.getConnection((err, connection) => {
            connection.query('CALL generalTopic_update(?, ?, ?, ?)', [generalTopic.id, generalTopic.name, generalTopic.status, authInfo.GET_USER_ID(request)], (error, results, fields) => { 
                connection.release();

                 if (error) throw error;

                if (results[0][0].SUCCESS === 0) { reply(statusMessage.BAD_REQUEST); }
                else {
                    let item = results[0][0];
                    item.status = !!item.status;
                    reply({ message: statusMessage.OK, item });
                }

            });
        });
    }
};