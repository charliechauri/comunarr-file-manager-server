const Joi = require('joi');
const ContentTypeController = require(`${global.__base}/src/routes/content-type/controller`);
const BASE_PATH = '/content-type';

module.exports = [
    {
        method: 'GET',
        path: BASE_PATH,
        config: {
            handler: ContentTypeController.GET
        }
    },
    {
        method: 'POST',
        path: BASE_PATH,
        config: {
            handler: ContentTypeController.POST,
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
            handler: ContentTypeController.PUT,
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