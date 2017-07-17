'use strict';

const db = require(`${global.__base}/src/middleware/db`);
const statusMessage = require(`${global.__base}/src/utils/request-status-message`);

module.exports = {
    GET: (request, reply) => {
        db.getConnection((err, connection) => {
            connection.query('CALL contentType_select', {}, (error, results, fields) => {
                connection.release();

                if (error) throw error;

                if (results.fieldCount === 0) { reply(statusMessage.NOT_FOUND); }
                else { reply(results[0]); }
                
            });
        });
    },

    POST: (request, reply) => {
        let contentType = request.payload;

        db.getConnection((err, connection) => {
            connection.query('CALL contentType_insert(?, ?)', [contentType.name, 1], (error, results, fields) => { // @todo define user ID
                connection.release();

                if (error) throw error;

                if (results[0][0].SUCCESS === 0) { reply(statusMessage.BAD_REQUEST); }
                else { reply(results[0][0]); }

            });
        });
    },

    PUT: (request, reply) => {
        let contentType = request.payload;

        db.getConnection((err, connection) => {
            connection.query('CALL contentType_update(?, ?, ?, ?)', [contentType.id, contentType.name, contentType.status, 1], (error, results, fields) => { // @todo define user ID
                connection.release();

                 if (error) throw error;

                if (results[0][0].SUCCESS === 0) { reply(statusMessage.BAD_REQUEST); }
                else { reply(results[0][0]); }

            });
        });
    }
};