const ComunarrProjectController = require(`${global.__base}/src/routes/comunarr-project/controller`);
const BASE_PATH = '/comunarr-project';

module.exports = [
    {
        method: 'GET',
        path: BASE_PATH,
        config: {
            handler: ComunarrProjectController.GET
        }
    },
    {
        method: 'POST',
        path: BASE_PATH,
        config: {
            handler: ComunarrProjectController.POST
        }
    },
    {
        method: 'PUT',
        path: BASE_PATH,
        config: {
            handler: ComunarrProjectController.PUT
        }
    }
];