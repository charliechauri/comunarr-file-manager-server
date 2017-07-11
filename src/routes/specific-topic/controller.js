'use strict';

const db = require(`${global.__base}/src/middleware/db`);

module.exports = {
    GET: (request, reply) => {
        db.getConnection((err, connection) => {
            connection.query('CALL specificTopic_select', {}, (error, results, fields) => {
                connection.release();

                if (error) throw error;

                reply(results[0]);
            });
        });
    },

    POST: (request, reply) => {
        let specificTopic = request.payload;

        specificTopic.generalTopic = specificTopic.generalTopic.join(',');

        db.getConnection((err, connection) => {
            connection.query('CALL specificTopic_insert(?, ?, ?)', [specificTopic.name, specificTopic.generalTopic, 1], (error, results, fields) => { // @todo define user ID
                connection.release();
                
                if (error) throw error;

                reply(results[0]);
            });
        });
    },

    PUT: (request, reply) => {
        let specificTopic = request.payload;

        specificTopic.generalTopic = specificTopic.generalTopic.join(',');

        db.getConnection((err, connection) => {
            connection.query('CALL specificTopic_update(?, ?, ?, ?, ?)', [specificTopic.id, specificTopic.name, specificTopic.generalTopic, specificTopic.status, 1], (error, results, fields) => { // @todo define user ID
                connection.release();
                
                if (error) throw error;

                reply(results[0]);
            });
        });
    }
};
