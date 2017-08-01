const Boom = require('boom');

module.exports = {
    NOT_FOUND: Boom.notFound('No se encontraron resultados'),
    UNAUTHORIZED: Boom.unauthorized('No tienes permisos para consultar este recurso'),
    BAD_REQUEST: Boom.badRequest('No se pudo completar la acción solicitada'),
    OK: 'La información se actualizó correctamente'
};