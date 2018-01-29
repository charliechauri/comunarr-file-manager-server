const BASE_PATH = '/disk-space';
const DiskSpaceController = require(`${global.__base}/src/routes/disk-space/controller`);

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
                handler: DiskSpaceController.GET
            }
        }
    ];
})();