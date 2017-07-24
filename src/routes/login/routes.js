const LoginController = require(`${global.__base}/src/routes/login/controller`);
const BASE_PATH = '/login';

module.exports = (() => {
    return [
        {
            method: 'POST',
            path: BASE_PATH,
            config: {
                handler: LoginController.POST
            }
        }
    ];
})();