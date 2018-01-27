'use strict';

const db = require(`${global.__base}/src/middleware/db`);
const statusMessage = require(`${global.__base}/src/utils/request-status-message`);
const authInfo = require(`${global.__base}/src/utils/auth-information`);

module.exports = {
    GET: (request, reply) => {
        db.getConnection((err, connection) => {
            connection.query('CALL collective_select', {}, (error, results, fields) => {
                connection.release();

                if (error) throw error;

                if (results[0].length === 0) { reply(statusMessage.NOT_FOUND); }
                else {
                    let data = results[0];
                    data.forEach(item => { item.status = !!item.status; });
                    reply(data);
                }

            });
        });
    },

    POST: (request, reply) => {
        let collective = request.payload;

        collective.idComunarrProject = collective.idComunarrProject.join(',');

        db.getConnection((err, connection) => {
            connection.query('CALL collective_insert(?, ?, ?)', [collective.name, collective.idComunarrProject, authInfo.GET_USER_ID(request)], (error, results, fields) => {
                connection.release();

                if (error) throw error;

                if (results[0][0].SUCCESS === 0) {
                    reply(statusMessage.BAD_REQUEST);
                }
                else {
                    let item = results[0][0];
                    item.status = !!item.status;
                    item.idComunarrProject = results[1].map(item => item.idComunarrProject);

                    reply({ message: statusMessage.OK, item });
                }

            });
        });
    },

    PUT: (request, reply) => {
        let collective = request.payload;

        collective.idComunarrProject = collective.idComunarrProject.join(',');

        db.getConnection((err, connection) => {
            connection.query('CALL collective_update(?, ?, ?, ?, ?)', [collective.id, collective.name, collective.idComunarrProject, collective.status, authInfo.GET_USER_ID(request)], (error, results, fields) => {
                connection.release();

                if (error) throw error;

                if (results[0][0].SUCCESS === 0) {
                    reply(statusMessage.BAD_REQUEST);
                }
                else {
                    let item = results[0][0];
                    item.status = !!item.status;
                    item.idComunarrProject = results[1].map(item => item.idComunarrProject);

                    reply({ message: statusMessage.OK, item });
                }

            });
        });
    }
};
