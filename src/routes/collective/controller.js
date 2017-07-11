'use strict';

const db = require(`${global.__base}/src/middleware/db`);

module.exports = {
    GET: (request, reply) => {
        db.getConnection((err, connection) => {
            connection.query('CALL collective_select', {}, (error, results, fields) => {
                connection.release();

                if (error) throw error;

                reply(results[0]);
            });
        });
    },

    POST: (request, reply) => {
        let collective = request.payload;

        collective.comunarrProject = collective.comunarrProject.join(',');

        db.getConnection((err, connection) => {
            connection.query('CALL collective_insert(?, ?, ?)', [collective.name, collective.comunarrProject, 1], (error, results, fields) => { // @todo define user ID
                connection.release();
                
                if (error) throw error;

                reply(results[0]);
            });
        });
    },

    PUT: (request, reply) => {
        let collective = request.payload;

        collective.comunarrProject = collective.comunarrProject.join(',');

        db.getConnection((err, connection) => {
            connection.query('CALL collective_update(?, ?, ?, ?, ?)', [collective.id, collective.name, collective.comunarrProject, collective.status, 1], (error, results, fields) => { // @todo define user ID
                connection.release();
                
                if (error) throw error;

                reply(results[0]);
            });
        });
    }
};
