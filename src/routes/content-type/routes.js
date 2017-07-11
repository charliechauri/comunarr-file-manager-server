const ContentTypeController = require(`${global.__base}/src/routes/content-type/controller`);
const BASE_PATH = '/contentType';

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
            handler: ContentTypeController.POST
        }
    },
    {
        method: 'PUT',
        path: BASE_PATH,
        config: {
            handler: ContentTypeController.PUT
        }
    }
];