const Joi = require('joi');
const CollectiveController = require(`${global.__base}/src/routes/collective/controller`);
const BASE_PATH = '/collective';

module.exports = (() => {
    return [
        {
            method: 'GET',
            path: BASE_PATH,
            config: {
                handler: CollectiveController.GET
            }
        },
        {
            method: 'POST',
            path: BASE_PATH,
            config: {
                handler: CollectiveController.POST,
                validate: {
                    payload: {
                        idComunarrProject: Joi.number().min(1).max(100000),
                        name: Joi.string().min(4).max(255)
                    }
                }
            }
        },
        {
            method: 'PUT',
            path: BASE_PATH,
            config: {
                handler: CollectiveController.PUT,
                validate: {
                    payload: {
                        id: Joi.number().min(1).max(100000),
                        idComunarrProject: Joi.number().min(1).max(100000),
                        name: Joi.string().min(4).max(255),
                        status: Joi.boolean()
                    }
                }
            }
        }
    ];
})();