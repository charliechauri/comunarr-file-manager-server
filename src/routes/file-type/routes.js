const FileTypeController = require(`${global.__base}/src/routes/file-type/controller`);
const BASE_PATH = '/file-type';

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
                handler: FileTypeController.GET
            }
        }
    ];
})();