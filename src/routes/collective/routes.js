const CollectiveController = require(`${global.__base}/src/routes/collective/controller`);
const BASE_PATH = '/collective';

module.exports = (() => {
    return [
        {
            method: 'GET',
            path: BASE_PATH,
            config: {
                handler: CollectiveController.GET
            }
        },
        {
            method: 'POST',
            path: BASE_PATH,
            config: {
                handler: CollectiveController.POST
            }
        },
        {
            method: 'PUT',
            path: BASE_PATH,
            config: {
                handler: CollectiveController.PUT
            }
        }
    ];
})();