const CollectiveComunarrProjectController = require(`${global.__base}/src/routes/collective-comunarr-project/controller`);
const BASE_PATH = '/collectiveComunarrProject';

module.exports = (() => {
    return [
        {
            method: 'GET',
            path: BASE_PATH,
            config: {
                handler: CollectiveComunarrProjectController.GET
            }
        }
    ];
})();