const collectiveRoutes = require(`${global.__base}/src/routes/collective/routes`);
const generalTopicRoutes = require(`${global.__base}/src/routes/general-topic/routes`);
const collectiveComunarrProjectRoutes = require(`${global.__base}/src/routes/collective-comunarr-project/routes`);
const specificTopicRoutes = require(`${global.__base}/src/routes/specific-topic/routes`);
const specificTopicGeneralTopicRoutes = require(`${global.__base}/src/routes/specific-topic-general-topic/routes`);
const contentTypeRoutes = require(`${global.__base}/src/routes/content-type/routes`);
const fileTypeRoutes = require(`${global.__base}/src/routes/file-type/routes`);

let routes = [];

routes = routes.concat(collectiveRoutes);
routes = routes.concat(generalTopicRoutes);
routes = routes.concat(collectiveComunarrProjectRoutes);
routes = routes.concat(specificTopicRoutes);
routes = routes.concat(specificTopicGeneralTopicRoutes);
routes = routes.concat(contentTypeRoutes);
routes = routes.concat(fileTypeRoutes);

module.exports = routes;