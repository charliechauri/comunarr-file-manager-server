const CollectiveComunarrProjectController = require(`${global.__base}/src/routes/collective-comunarr-project/controller`);
const BASE_PATH = '/collective-comunarr-project';

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
                handler: CollectiveComunarrProjectController.GET
            }
        }
    ];
})();