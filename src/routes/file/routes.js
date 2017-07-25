const Joi = require('joi');
const Extension = require('joi-date-extensions');
const JoiExtended = Joi.extend(Extension);
const FileController = require(`${global.__base}/src/routes/file/controller`);
const BASE_PATH = '/file';
const schema = JoiExtended.date().format('YYYY-MM-DD');

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
                handler: FileController.GET
            }
        },
        {
            method: 'POST',
            path: BASE_PATH,
            config: {
                auth: {
                    strategy: 'simple',
                    scope: ['user']
                },                
                handler: FileController.POST
            }
        },
        {
            method: 'PUT',
            path: BASE_PATH,
            config: {
                auth: {
                    strategy: 'simple',
                    scope: ['user']
                },                
                handler: FileController.PUT
            }
        },
        {
            method: 'DELETE',
            path: BASE_PATH.concat('/{id}'),
            config: {
                auth: {
                    strategy: 'simple',
                    scope: ['user']
                },                
                handler: FileController.DELETE
            }
        },
        {
            method: 'POST',
            path: BASE_PATH.concat('/specific-search'),
            config: {
                auth: {
                    strategy: 'simple',
                    scope: ['user']
                },                
                handler: FileController.POST_SPECIFIC_SEARCH,
                validate: {                 
                    payload: {
                        name: Joi.string().min(4).max(255).allow(null),
                        author: Joi.object().keys({
                            OR: Joi.array().items(Joi.string().min(4).max(255).optional()),
                            NOT: Joi.array().items(Joi.string().min(4).max(255).optional())
                        }),
                        place: Joi.object().keys({
                            OR: Joi.array().items(Joi.string().min(4).max(255).optional()),
                            NOT: Joi.array().items(Joi.string().min(4).max(255).optional())
                        }),
                        idCollective: Joi.object().keys({
                            OR: Joi.array().items(Joi.number().integer().min(1).max(10000)),
                            NOT: Joi.array().items(Joi.number().integer().min(1).max(10000))
                        }),
                        idComunarrProject: Joi.object().keys({
                            OR: Joi.array().items(Joi.number().integer().min(1).max(10000)),
                            NOT: Joi.array().items(Joi.number().integer().min(1).max(10000))
                        }),
                        idGeneralTopic: Joi.object().keys({
                            OR: Joi.array().items(Joi.number().integer().min(1).max(10000)),
                            NOT: Joi.array().items(Joi.number().integer().min(1).max(10000))
                        }),
                        idSpecificTopic: Joi.object().keys({
                            OR: Joi.array().items(Joi.number().integer().min(1).max(10000)),
                            NOT: Joi.array().items(Joi.number().integer().min(1).max(10000))
                        }),
                        idUser: Joi.object().keys({
                            OR: Joi.array().items(Joi.number().integer().min(1).max(10000)),
                            NOT: Joi.array().items(Joi.number().integer().min(1).max(10000))
                        }),
                        idContentType: Joi.object().keys({
                            OR: Joi.array().items(Joi.number().integer().min(1).max(10000)),
                            NOT: Joi.array().items(Joi.number().integer().min(1).max(10000))
                        }),
                        idFileType: Joi.object().keys({
                            OR: Joi.array().items(Joi.number().integer().min(1).max(10000)),
                            NOT: Joi.array().items(Joi.number().integer().min(1).max(10000))
                        }),
                        keyWords: Joi.object().keys({
                            OR: Joi.array().items(Joi.number().integer().min(1).max(10000)),
                            NOT: Joi.array().items(Joi.number().integer().min(1).max(10000)),
                            AND: Joi.array().items(Joi.number().integer().min(1).max(10000))
                        }) ,
                        relatedDate: Joi.array().items(JoiExtended.date().format('YYYY-MM-DD')).min(2).max(2),
                        updateDate: Joi.array().items(JoiExtended.date().format('YYYY-MM-DD')).min(2).max(2)
                     }
                 }
            }
        },
    ];
})();