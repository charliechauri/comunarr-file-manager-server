const FileController = require(`${global.__base}/src/routes/file/controller`);
const BASE_PATH = '/file';

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
                handler: FileController.POST_SPECIFIC_SEARCH
            }
        },
    ];
})();