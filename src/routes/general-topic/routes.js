const Joi = require('joi');
const GeneralTopicController = require(`${global.__base}/src/routes/general-topic/controller`);
const BASE_PATH = '/general-topic';

module.exports = [
    {
        method: 'GET',
        path: BASE_PATH,
        config: {
            handler: GeneralTopicController.GET
        }
    },
    {
        method: 'POST',
        path: BASE_PATH,
        config: {
            handler: GeneralTopicController.POST,
            validate: {
                payload: {
                    name: Joi.string().min(4).max(255)
                }
            }
        }
    },
    {
        method: 'PUT',
        path: BASE_PATH,
        config: {
            handler: GeneralTopicController.PUT,
            validate: {
                payload: {
                    id: Joi.number().min(1).max(100000),
                    name: Joi.string().min(4).max(255),
                    status: Joi.boolean()
                }
            }
        }
    }
];