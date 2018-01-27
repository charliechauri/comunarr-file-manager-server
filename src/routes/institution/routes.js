const Joi = require('joi');
const InstitutionController = require(`${global.__base}/src/routes/institution/controller`);
const BASE_PATH = '/institution';

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
                handler: InstitutionController.GET
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
                handler: InstitutionController.POST,
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
                handler: InstitutionController.PUT,
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
})();