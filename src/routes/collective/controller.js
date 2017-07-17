'use strict';

const db = require(`${global.__base}/src/middleware/db`);
const statusMessage = require(`${global.__base}/src/utils/request-status-message`);

module.exports = {
    GET: (request, reply) => {
        db.getConnection((err, connection) => {
            connection.query('CALL collective_select', {}, (error, results, fields) => {
                connection.release();

                if (error) throw error;

                if (results.fieldCount === 0) { reply(statusMessage.NOT_FOUND); }
                else { reply(results[0]); }
                    
            });
        });
    },

    POST: (request, reply) => {
        let collective = request.payload;

        collective.idComunarrProject = collective.idComunarrProject.join(',');

        db.getConnection((err, connection) => {
            connection.query('CALL collective_insert(?, ?, ?)', [collective.name, collective.idComunarrProject, 1], (error, results, fields) => { // @todo define user ID
                connection.release();
                
                if (error) throw error;

                if (results[0][0].SUCCESS === 0) {
                    reply(statusMessage.BAD_REQUEST);
                }
                else {
                    let resultCollective = results[0][0];
                    resultCollective.idComunarrProject = results[1].map(item => item.idComunarrProject);

                    reply(resultCollective);
                }

            });
        });
    },

    PUT: (request, reply) => {
        let collective = request.payload;

        collective.idComunarrProject = collective.idComunarrProject.join(',');

        db.getConnection((err, connection) => {
            connection.query('CALL collective_update(?, ?, ?, ?, ?)', [collective.id, collective.name, collective.idComunarrProject, collective.status, 1], (error, results, fields) => { // @todo define user ID
                connection.release();
                
                if (error) throw error;

                if (results[0][0].SUCCESS === 0) {
                    reply(statusMessage.BAD_REQUEST);
                }
                else {
                    let resultCollective = results[0][0];
                    resultCollective.idComunarrProject = results[1].map(item => item.idComunarrProject);

                    reply(resultCollective);
                }
                
            });
        });
    }
};
