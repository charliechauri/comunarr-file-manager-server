const GeneralTopicController = require(`${global.__base}/src/routes/general-topic/controller`);
const BASE_PATH = '/general-topic';

module.exports = [
    {
        method: 'GET',
        path: BASE_PATH,
        config: {
            handler: GeneralTopicController.GET
        }
    },
    {
        method: 'POST',
        path: BASE_PATH,
        config: {
            handler: GeneralTopicController.POST
        }
    },
    {
        method: 'PUT',
        path: BASE_PATH,
        config: {
            handler: GeneralTopicController.PUT
        }
    }
];