'use strict';

const db = require(`${global.__base}/src/middleware/db`);

const statusMessage = require(`${global.__base}/src/utils/request-status-message`);

module.exports = {
    GET: (request, reply) => {
        db.getConnection((err, connection) => {
            connection.query('CALL specificTopic_generalTopic_select', {}, (error, results, fields) => {
                connection.release();

                if (error) throw error;

                if (results[0][0].SUCCESS === 0) { reply(statusMessage.BAD_REQUEST); }
                else { reply(results[0][0]); }

            });
        });
    }
};
