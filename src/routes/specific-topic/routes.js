const SpecificTopicController = require(`${global.__base}/src/routes/specific-topic/controller`);
const BASE_PATH = '/specificTopic';

module.exports = (() => {
    return [
        {
            method: 'GET',
            path: BASE_PATH,
            config: {
                handler: SpecificTopicController.GET
            }
        },
        {
            method: 'POST',
            path: BASE_PATH,
            config: {
                handler: SpecificTopicController.POST
            }
        },
        {
            method: 'PUT',
            path: BASE_PATH,
            config: {
                handler: SpecificTopicController.PUT
            }
        }
    ];
})();