global.__base = `${__dirname}`;

const Hapi = require('hapi');
const routes = require(`${global.__base}/src/routes/index`);
const Auth = require(`${global.__base}/src/config/auth`);
const BasicAuth = require('hapi-auth-basic');
const Inert = require('inert');

const server = new Hapi.Server();

server.connection({
    host: 'localhost',
    port: 8000,
    routes: { cors: !!process.env.CORS_ENV }
});

server.register([BasicAuth, Inert], err => {
    if (err) throw err;
    server.auth.strategy('simple', 'basic', {
        validateFunc: Auth.validate
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