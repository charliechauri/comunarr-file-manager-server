'use strict';

const db = require(`${global.__base}/src/middleware/db`);

module.exports = {
    GET: (request, reply) => {
        db.getConnection((err, connection) => {
            connection.query('CALL user_select', {}, (error, results, fields) => {
                connection.release();

                if (error) throw error;

                reply(results[0]);
            });
        });
    },

    POST: (request, reply) => {
        let user = request.payload;

        db.getConnection((err, connection) => {
            connection.query('CALL user_insert(?, ?, ?, ?, ?)', [user.name, user.password, user.userName, user.idUserType, 1], (error, results, fields) => { // @todo define user ID
                connection.release();

                if (error) throw error;

                reply(results[0]);
            });
        });
    },

    PUT: (request, reply) => {
        let user = request.payload;

        db.getConnection((err, connection) => {
            connection.query('CALL user_update(?, ?, ?, ?, ?, ?)', [user.id, user.name, user.status, user.userName, user.idUserType, 1], (error, results, fields) => { // @todo define user ID
                connection.release();

                 if (error) throw error;

                reply(results[0]);
            });
        });
    }
};