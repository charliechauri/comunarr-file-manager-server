const Joi = require('joi');
const SpecificTopicController = require(`${global.__base}/src/routes/specific-topic/controller`);
const BASE_PATH = '/specific-topic';

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
                handler: SpecificTopicController.GET
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
                handler: SpecificTopicController.POST,
                validate: {
                    payload: {
                        name: Joi.string().min(4).max(255).required(),
                        idGeneralTopic: Joi.array().items(Joi.number().min(1).max(10000)).required()
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
                handler: SpecificTopicController.PUT,
                validate: {
                    payload: {
                        id: Joi.number().min(1).max(1000000).required(),
                        name: Joi.string().min(4).max(255).required(),
                        idGeneralTopic: Joi.array().items(Joi.number().min(1).max(10000)).required(),
                        status: Joi.boolean().required()
                    }
                }
            }
        }
    ];
})();