global.__base = `${__dirname}`;

const Hapi = require('hapi');
const routes = require(`${global.__base}/src/routes/index`);

const server = new Hapi.Server();

server.connection({
    host: 'localhost',
    port: 8000,
    routes: { cors: process.env.CORS_ENV }
});

for (let route in routes) {
    server.route(routes[route]);
}

server.start(err => {
    if (err) {
        throw err;
    }
    console.log('Server running at:', server.info.uri);
});