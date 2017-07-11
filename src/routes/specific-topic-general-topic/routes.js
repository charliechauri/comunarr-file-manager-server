const SpecificTopicGeneralTopicController = require(`${global.__base}/src/routes/specific-topic-general-topic/controller`);
const BASE_PATH = '/specificTopicGeneralTopic';

module.exports = (() => {
    return [
        {
            method: 'GET',
            path: BASE_PATH,
            config: {
                handler: SpecificTopicGeneralTopicController.GET
            }
        }
    ];
})();