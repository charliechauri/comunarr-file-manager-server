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
                scope: ['user']
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
                    name: Joi.string().min(4).max(255).required(),
                    userName: Joi.string().min(4).max(255).required(),
                    idUserType: Joi.number().min(1).max(3).required(),
                    idInstitution: Joi.number().min(1).required(),
                    password: Joi.string().min(4).max(255).required(),
                    confirmPassword: Joi.string().min(4).max(255).required()
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
                    id: Joi.number().min(1).max(1000000).required(),
                    name: Joi.string().min(4).max(255).required(),
                    userName: Joi.string().min(4).max(255).required(),
                    idUserType: Joi.number().min(1).max(3).required(),
                    idInstitution: Joi.number().min(1).required(),
                    status: Joi.boolean().required()
                }
            }
        }
    },
    {
        method: 'POST',
        path: `${BASE_PATH}/password`,
        config: {
            auth: {
                strategy: 'simple',
                scope: ['user']
            },
            handler: UserController.CHANGE_OWN_PASSWORD,
            validate: {
                payload: {
                    id: Joi.number().min(1).max(1000000).required(),
                    password: Joi.string().min(4).max(255).required(),
                    newPassword: Joi.string().min(4).max(255).required(),
                    confirmPassword: Joi.string().min(4).max(255).required()
                }
            }
        }
    },
    {
        method: 'POST',
        path: `${BASE_PATH}/password/admin`,
        config: {
            auth: {
                strategy: 'simple',
                scope: ['admin']
            },
            handler: UserController.CHANGE_PASSWORD,
            validate: {
                payload: {
                    id: Joi.number().min(1).max(1000000).required(),
                    newPassword: Joi.string().min(4).max(255).required(),
                    confirmPassword: Joi.string().min(4).max(255).required()
                }
            }
        }
    }
];