const SpecificTopicGeneralTopicController = require(`${global.__base}/src/routes/specific-topic-general-topic/controller`);
const BASE_PATH = '/specific-topic-general-topic';

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
                handler: SpecificTopicGeneralTopicController.GET
            }
        }
    ];
})();