'use strict';

const db = require(`${global.__base}/src/middleware/db`);
const boom = require('boom');

module.exports = {
    POST: (request, reply) => {

        const username = request.payload.username,
            password = request.payload.password;

        db.getConnection((err, connection) => {
            const query = `SELECT * FROM user WHERE status = 1 && userName =${connection.escape(username)} && password=${connection.escape(password)}`;
            connection.query(query, {}, (error, results) => {
                connection.release();

                if (error) throw error;

                if (results.length === 0) {
                    reply(boom.badRequest('Se ha ingresado un usuario o contraseña inválido', { username, password }));
                } else {
                    reply(results[0]);
                }
            });
        });
    }
};
