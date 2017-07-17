const Boom = require('boom');

module.exports = {
    NOT_FOUND: Boom.notFound('No results found.'),
    UNAUTHORIZED: Boom.unauthorized('You have not permission to access this resource.'),
    BAD_REQUEST: Boom.badRequest('The element could not be created/updated.') 
};