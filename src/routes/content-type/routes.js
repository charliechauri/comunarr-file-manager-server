const Joi = require('joi');
const ContentTypeController = require(`${global.__base}/src/routes/content-type/controller`);
const BASE_PATH = '/content-type';

module.exports = [
    {
        method: 'GET',
        path: BASE_PATH,
        config: {
            auth: {
                strategy: 'simple',
                scope: ['user']
            },            
            handler: ContentTypeController.GET
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
            handler: ContentTypeController.POST,
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
            handler: ContentTypeController.PUT,
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