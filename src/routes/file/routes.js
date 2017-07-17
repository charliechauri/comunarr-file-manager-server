const FileController = require(`${global.__base}/src/routes/file/controller`);
const BASE_PATH = '/file';

module.exports = (() => {
    return [
        {
            method: 'GET',
            path: BASE_PATH,
            config: {
                handler: FileController.GET
            }
        },
        {
            method: 'POST',
            path: BASE_PATH,
            config: {
                handler: FileController.POST
            }
        },
        {
            method: 'PUT',
            path: BASE_PATH,
            config: {
                handler: FileController.PUT
            }
        },
        {
            method: 'DELETE',
            path: BASE_PATH.concat('/{id}'),
            config: {
                handler: FileController.DELETE
            }
        }
    ];
})();