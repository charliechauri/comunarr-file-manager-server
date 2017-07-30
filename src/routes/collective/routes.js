const Joi = require('joi');
const CollectiveController = require(`${global.__base}/src/routes/collective/controller`);
const BASE_PATH = '/collective';

module.exports = (() => {
    return [
        {
            method: 'GET',
            path: BASE_PATH,
            config: {
                auth: {
                    strategy: 'simple',
                    scope: ['user']
                },
                handler: CollectiveController.GET
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
                handler: CollectiveController.POST,
                validate: {
                    payload: {
                        idComunarrProject: Joi.array().items(Joi.number().min(1).max(10000)).required(),
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
                handler: CollectiveController.PUT,
                validate: {
                    payload: {
                        id: Joi.number().min(1).max(100000).required(),
                        idComunarrProject: Joi.array().items(Joi.number().min(1).max(10000)).required(),
                        name: Joi.string().min(4).max(255).required(),
                        status: Joi.boolean().required()
                    }
                }
            }
        }
    ];
})();