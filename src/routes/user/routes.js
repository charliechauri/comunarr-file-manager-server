const UserController = require(`${global.__base}/src/routes/user/controller`);
const BASE_PATH = '/user';

module.exports = [
    {
        method: 'GET',
        path: BASE_PATH,
        config: {
            handler: UserController.GET
        }
    },
    {
        method: 'POST',
        path: BASE_PATH,
        config: {
            handler: UserController.POST
        }
    },
    {
        method: 'PUT',
        path: BASE_PATH,
        config: {
            handler: UserController.PUT
        }
    }
];