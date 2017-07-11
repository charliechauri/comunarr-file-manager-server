'use strict';

const db = require(`${global.__base}/src/middleware/db`);

module.exports = {
    GET: (request, reply) => {
        db.getConnection((err, connection) => {
            connection.query('CALL specificTopic_generalTopic_select', {}, (error, results, fields) => {
                connection.release();

                if (error) throw error;

                reply(results[0]);
            });
        });
    }
};
