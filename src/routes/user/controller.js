'use strict';

const db = require(`${global.__base}/src/middleware/db`);
const statusMessage = require(`${global.__base}/src/utils/request-status-message`);
const authInfo = require(`${global.__base}/src/utils/auth-information`);
const Boom = require('boom');

module.exports = {
    GET: (request, reply) => {
        db.getConnection((err, connection) => {
            connection.query('CALL user_select', {}, (error, results, fields) => {
                connection.release();

                if (error) throw error;

                if (results[0].length === 0) { reply(statusMessage.NOT_FOUND); }
                else {
                    results[0].forEach(item => item.status = !!item.status);
                    reply(results[0]);
                }

            });
        });
    },

    POST: (request, reply) => {
        let user = request.payload;

        db.getConnection((err, connection) => {
            connection.query('CALL user_insert(?, ?, ?, ?, ?, ?)', [user.name, user.password, user.userName, user.idUserType, user.idInstitution, authInfo.GET_USER_ID(request)], (error, results, fields) => {
                connection.release();

                if (error) throw error;

                if (results[0][0].SUCCESS === 0) { reply(statusMessage.BAD_REQUEST); }
                else {
                    let item = results[0][0];
                    item.status = !!item.status;
                    reply({ message: statusMessage.OK, item });
                }

            });
        });
    },

    PUT: (request, reply) => {
        let user = request.payload;

        db.getConnection((err, connection) => {
            connection.query('CALL user_update(?, ?, ?, ?, ?, ?, ?)', [user.id, user.name, user.status, user.userName, user.idUserType, user.idInstitution, authInfo.GET_USER_ID(request)], (error, results, fields) => {
                connection.release();

                if (error) throw error;

                if (results[0][0].SUCCESS === 0) { reply(statusMessage.BAD_REQUEST); }
                else {
                    let item = results[0][0];
                    item.status = !!item.status;
                    reply({ message: statusMessage.OK, item });
                }

            });
        });
    },

    CHANGE_OWN_PASSWORD: (request, reply) => {
        let user = request.payload;
        const currentSolicitantId = authInfo.GET_USER_ID(request);

        if (currentSolicitantId !== user.id) {
            reply(Boom.badRequest('Sólo es posible cambiar tu propia contraseña'));
            return;
        }

        db.getConnection((err, connection) => {
            const query = `CALL user_updatePassword(${connection.escape(user.id)}, ${connection.escape(user.password)}, ${connection.escape(user.newPassword)}, ${connection.escape(user.confirmPassword)}, ${connection.escape(user.id)})`;

            connection.query(query, {}, (error, results) => {

                if (error) throw error;

                if (results[0][0].SUCCESS === 1) {
                    reply({ message: 'Se actualizó la contraseña de forma correcta' });
                } else {
                    reply(Boom.badRequest('Usuario o contraseña incorrectos'));
                }

            });
        });
    },
    /**
     * Admin user
     * @param {any} request
     * @param {any} reply
     */
    CHANGE_PASSWORD: (request, reply) => {
        let user = request.payload;
        const adminId = authInfo.GET_USER_ID(request);

        db.getConnection((err, connection) => {
            const query = `CALL user_updatePassword(${connection.escape(user.id)}, null, ${connection.escape(user.newPassword)}, ${connection.escape(user.confirmPassword)}, ${connection.escape(adminId)})`;

            connection.query(query, {}, (error, results) => {
                if (error) throw error;

                if (results[0][0].SUCCESS === 1) {
                    reply({ message: 'Se actualizó la contraseña de forma correcta' });
                } else {
                    reply(Boom.badRequest('Usuario o contraseña incorrectos'));
                }
            });
        });
    }
};