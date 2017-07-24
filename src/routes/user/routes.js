const Joi = require('joi');
const UserController = require(`${global.__base}/src/routes/user/controller`);
const BASE_PATH = '/user';

module.exports = [
    {
        method: 'GET',
        path: BASE_PATH,
        config: {
             auth: {
                strategy: 'simple',
                scope: ['admin']
            },  
            handler: UserController.GET
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
            handler: UserController.POST,
            validate: {
                payload: {
                    name: Joi.string().min(4).max(255),
                    userName: Joi.string().min(4).max(255),
                    idUserType: Joi.number().min(1).max(3),
                    password: Joi.string().min(4).max(255),
                    confirmPassword: Joi.string().min(4).max(255)
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
            handler: UserController.PUT,
            validate: {
                payload: {
                    id: Joi.number().min(1).max(1000000),
                    name: Joi.string().min(4).max(255),
                    userName: Joi.string().min(4).max(255),
                    idUserType: Joi.number().min(1).max(3),
                    status: Joi.boolean()
                }
            }
        }
    }
];