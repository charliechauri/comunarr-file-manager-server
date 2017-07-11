const FileTypeController = require(`${global.__base}/src/routes/file-type/controller`);
const BASE_PATH = '/fileType';

module.exports = (() => {
    return [
        {
            method: 'GET',
            path: BASE_PATH,
            config: {
                handler: FileTypeController.GET
            }
        }
    ];
})();