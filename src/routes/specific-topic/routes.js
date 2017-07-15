const Joi = require('joi');
const SpecificTopicController = require(`${global.__base}/src/routes/specific-topic/controller`);
const BASE_PATH = '/specific-topic';

module.exports = (() => {
    return [
        {
            method: 'GET',
            path: BASE_PATH,
            config: {
                handler: SpecificTopicController.GET
            }
        },
        {
            method: 'POST',
            path: BASE_PATH,
            config: {
                handler: SpecificTopicController.POST,
                validate: {
                    payload: {
                        name: Joi.string().min(4).max(255),
                        idGeneralTopic: Joi.number().min(1).max(1000000)
                    }
                }
            }
        },
        {
            method: 'PUT',
            path: BASE_PATH,
            config: {
                handler: SpecificTopicController.PUT,
                validate: {
                    payload: {
                        id: Joi.number().min(1).max(1000000),
                        name: Joi.string().min(4).max(255),
                        idGeneralTopic: Joi.number().min(1).max(1000000),
                        status: Joi.boolean()
                    }
                }
            }
        }
    ];
})();