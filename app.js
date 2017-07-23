global.__base = `${__dirname}`;

const Hapi = require('hapi');
const routes = require(`${global.__base}/src/routes/index`);
const BasicAuth = require('hapi-auth-basic');

const server = new Hapi.Server();

server.connection({
    host: 'localhost',
    port: 8000,
    routes: { cors: !!process.env.CORS_ENV }
});

server.register(BasicAuth, err => {
    if (err) throw err;
    server.auth.strategy('simple', 'basic', {
        validateFunc: (request, username, password, callback) => {
            console.log(username);
            console.log(password);
            if (username !== 'charli' && password !== 'Tess2016') {
                return callback(null, false);
            }

            callback(null, true, { username });
        }
    });

    for (let route in routes) {
        server.route(routes[route]);
    }

    server.start(err => {
        if (err) {
            console.log(err);
            throw err;
        }
        console.log('Server running at:', server.info.uri);
    });
});