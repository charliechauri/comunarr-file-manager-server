const Joi = require('joi');
const ComunarrProjectController = require(`${global.__base}/src/routes/comunarr-project/controller`);
const BASE_PATH = '/comunarr-project';

module.exports = [
    {
        method: 'GET',
        path: BASE_PATH,
        config: {
            auth: {
                strategy: 'simple',
                scope: ['user']
            },
            handler: ComunarrProjectController.GET
        }
    },
    {
        method: 'POST',
        path: BASE_PATH,
        config: {
            auth: {
                strategy: 'simple',
                scope: ['admin']
            },
            handler: ComunarrProjectController.POST,
            validate: {
                payload: {
                    name: Joi.string().min(4).max(255).required()
                }
            }
        }
    },
    {
        method: 'PUT',
        path: BASE_PATH,
        config: {
            auth: {
                strategy: 'simple',
                scope: ['admin']
            },
            handler: ComunarrProjectController.PUT,
            validate: {
                payload: {
                    id: Joi.number().min(1).max(100000).required(),
                    name: Joi.string().min(4).max(255).required(),
                    status: Joi.boolean().required()
                }
            }
        }
    }
];