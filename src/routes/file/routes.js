const Joi = require('joi');
const Extension = require('joi-date-extensions');
const JoiExtended = Joi.extend(Extension);
const FileController = require(`${global.__base}/src/routes/file/controller`);
const BASE_PATH = '/file';
const constants = require(`${global.__base}/src/config/constants`);

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
                handler: FileController.GET,
                validate: {
                    query: {
                        name: Joi.string().min(4).max(255),
                        author: Joi.string().min(4).max(255),
                        idComunarrProject: Joi.number().integer().min(1).max(10000),
                        idCollective: Joi.number().integer().min(1).max(10000),
                        idGeneralTopic: Joi.number().integer().min(1).max(10000),
                        uploadedByMe: Joi.boolean().required(),
                    }
                }
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
                payload: {
                    maxBytes: 209715200,
                    output: 'file',
                    parse: true,
                    uploads: `./${constants.directories.tempFiles}`,
                    allow: 'multipart/form-data'
                },
                validate: {
                    payload: {
                        file: Joi.any().required(),
                        name: Joi.string().min(4).max(255).required(),
                        author: Joi.string().min(4).max(255).required(),
                        place: Joi.string().min(4).max(255),
                        relatedDate: JoiExtended.date().format(['YYYY-MM-DD']),
                        idCollective: Joi.number().integer().min(1).max(100000).required(),
                        idComunarrProject: Joi.number().integer().min(1).max(100000).required(),
                        idGeneralTopic: Joi.number().integer().min(1).max(100000).required(),
                        idSpecificTopic: Joi.number().integer().min(1).max(100000),
                        idPrivacyType: Joi.number().integer().min(1).max(100000).required(),
                        idContentType: Joi.number().integer().min(1).max(100000).required(),
                        keyWords: Joi.alternatives(Joi.string().min(4).max(255), Joi.array().items(Joi.string().min(4).max(255)))
                    }
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
                payload: {
                    maxBytes: 209715200,
                    output: 'file',
                    parse: true,
                    uploads: `./${constants.directories.tempFiles}`,
                    allow: 'multipart/form-data'
                },
                validate: {
                    payload: {
                        file: Joi.any(),
                        id: Joi.number().integer().min(1).required(),
                        name: Joi.string().min(4).max(255).required(),
                        fileType: Joi.string().min(1).max(255).required(),
                        timestamp: Joi.string().min(1).max(255).required(),
                        author: Joi.string().min(4).max(255).required(),
                        place: Joi.string().min(4).max(255),
                        relatedDate: JoiExtended.date().format(['YYYY-MM-DD']),
                        idCollective: Joi.number().integer().min(1).max(100000).required(),
                        idComunarrProject: Joi.number().integer().min(1).max(100000).required(),
                        idGeneralTopic: Joi.number().integer().min(1).max(100000).required(),
                        idSpecificTopic: Joi.number().integer().min(1).max(100000),
                        idPrivacyType: Joi.number().integer().min(1).max(100000).required(),
                        idContentType: Joi.number().integer().min(1).max(100000).required(),
                        keyWords: Joi.alternatives(Joi.string().min(4).max(255), Joi.array().items(Joi.string().min(4).max(255))),
                        size: Joi.number().integer().required()
                    }
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
                        name: Joi.string().min(4).max(255),
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
                        }),
                        relatedDate: Joi.array().items(JoiExtended.date().format(['YYYY-MM-DD'])).min(2).max(2),
                        updateDate: Joi.array().items(JoiExtended.date().format(['YYYY-MM-DD'])).min(2).max(2)
                    }
                }
            }
        },
        {
            method: 'GET',
            path: BASE_PATH.concat('/{id}'),
            config: {
                auth: {
                    strategy: 'simple',
                    scope: ['user']
                },
                handler: FileController.GET_FILE
            }
        },
    ];
})();