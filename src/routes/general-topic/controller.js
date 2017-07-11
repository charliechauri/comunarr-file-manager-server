'use strict';

const db = require(`${global.__base}/src/middleware/db`);

module.exports = {
    GET: (request, reply) => {
        db.getConnection((err, connection) => {
            connection.query('CALL generalTopic_select', {}, (error, results, fields) => {
                connection.release();

                if (error) throw error;

                reply(results[0]);
                
            });
        });
    },

    POST: (request, reply) => {
        let generalTopic = request.payload;

        db.getConnection((err, connection) => {
            connection.query('CALL generalTopic_insert(?, ?)', [generalTopic.name, 1], (error, results, fields) => { // @todo define user ID
                connection.release();

                if (error) throw error;

                reply(results[0]);
            });
        });
    },

    PUT: (request, reply) => {
        let generalTopic = request.payload;

        db.getConnection((err, connection) => {
            connection.query('CALL generalTopic_update(?, ?, ?, ?, ?)', [generalTopic.id, generalTopic.name, generalTopic.status, 1], (error, results, fields) => { // @todo define user ID
                connection.release();

                 if (error) throw error;

                reply(results[0]);
            });
        });
    }
};