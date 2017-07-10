'use strict';

const db = require(`${global.__base}/src/middleware/db`);

module.exports = {
    GET: (request, reply) => {
        db.getConnection((err, connection) => {
            connection.query('CALL comunarrProject_select', {}, (error, results, fields) => {
                connection.release();
                reply(results);
            });
        });
    },

    POST: (request, reply) => {
        let comunarrProject = request.payload;

        db.getConnection((err, connection) => {
            connection.query('CALL comunarrProject_insert(?, ?)', [comunarrProject.name, 1], (error, results, fields) => { // @todo define user ID
                connection.release();
                reply(results);
                // Handle error after the release.
                if (error) throw error;
            });
        });
    },

    PUT: (request, reply) => {
        let comunarrProject = request.payload;

        db.getConnection((err, connection) => {
            connection.query('CALL comunarrProject_update(?, ?, ?, ?, ?)', [comunarrProject.id, comunarrProject.name, comunarrProject.status, 1], (error, results, fields) => { // @todo define user ID
                connection.release();
                reply(results);
                // Handle error after the release.
                if (error) throw error;
            });
        });
    }
};