const collectivesRoutes = require(`${global.__base}/src/routes/collective/routes`);

let routes = [];

routes = routes.concat(collectivesRoutes);

module.exports = routes;