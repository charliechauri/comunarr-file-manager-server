const comunarrProjectRoutes = require(`${global.__base}/src/routes/comunarr-project/routes`);
const collectiveRoutes = require(`${global.__base}/src/routes/collective/routes`);
const generalTopicRoutes = require(`${global.__base}/src/routes/general-topic/routes`);
const collectiveComunarrProjectRoutes = require(`${global.__base}/src/routes/collective-comunarr-project/routes`);
const specificTopicRoutes = require(`${global.__base}/src/routes/specific-topic/routes`);
const specificTopicGeneralTopicRoutes = require(`${global.__base}/src/routes/specific-topic-general-topic/routes`);
const contentTypeRoutes = require(`${global.__base}/src/routes/content-type/routes`);
const fileTypeRoutes = require(`${global.__base}/src/routes/file-type/routes`);
const keyWordRoutes = require(`${global.__base}/src/routes/key-word/routes`);
const userRoutes = require(`${global.__base}/src/routes/user/routes`);
const fileRoutes = require(`${global.__base}/src/routes/file/routes`);
const loginRoutes = require(`${global.__base}/src/routes/login/routes`);
const institutionRoutes = require(`${global.__base}/src/routes/institution/routes`);
const diskSpaceRoutes = require(`${global.__base}/src/routes/disk-space/routes`);

let routes = [];

routes = routes.concat(comunarrProjectRoutes);
routes = routes.concat(collectiveRoutes);
routes = routes.concat(generalTopicRoutes);
routes = routes.concat(collectiveComunarrProjectRoutes);
routes = routes.concat(specificTopicRoutes);
routes = routes.concat(specificTopicGeneralTopicRoutes);
routes = routes.concat(contentTypeRoutes);
routes = routes.concat(fileTypeRoutes);
routes = routes.concat(keyWordRoutes);
routes = routes.concat(userRoutes);
routes = routes.concat(fileRoutes);
routes = routes.concat(loginRoutes);
routes = routes.concat(institutionRoutes);
routes = routes.concat(diskSpaceRoutes);

module.exports = routes;