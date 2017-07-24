'use strict';

const db = require(`${global.__base}/src/middleware/db`);
const statusMessage = require(`${global.__base}/src/utils/request-status-message`);
const authInfo = require(`${global.__base}/src/utils/auth-information`);

module.exports = {
    GET: (request, reply) => {
        db.getConnection((err, connection) => {
            connection.query('CALL user_select', {}, (error, results, fields) => {
                connection.release();

                if (error) throw error;

                if (results.fieldCount === 0) { reply(statusMessage.NOT_FOUND); }
                else { reply(results[0]); }
                
            });
        });
    },

    POST: (request, reply) => {
        let user = request.payload;

        db.getConnection((err, connection) => {
            connection.query('CALL user_insert(?, ?, ?, ?, ?)', [user.name, user.password, user.userName, user.idUserType, authInfo.GET_USER_ID(request)], (error, results, fields) => {
                connection.release();

                if (error) throw error;

                if (results[0][0].SUCCESS === 0) { reply(statusMessage.BAD_REQUEST); }
                else { reply(results[0][0]); }

            });
        });
    },

    PUT: (request, reply) => {
        let user = request.payload;

        db.getConnection((err, connection) => {
            connection.query('CALL user_update(?, ?, ?, ?, ?, ?)', [user.id, user.name, user.status, user.userName, user.idUserType, authInfo.GET_USER_ID(request)], (error, results, fields) => { 
                connection.release();

                 if (error) throw error;

                if (results[0][0].SUCCESS === 0) { reply(statusMessage.BAD_REQUEST); }
                else { reply(results[0][0]); }

            });
        });
    }
};