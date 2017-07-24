const KeyWordController = require(`${global.__base}/src/routes/key-word/controller`);
const BASE_PATH = '/key-word';

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
                handler: KeyWordController.GET
            }
        }
    ];
})();