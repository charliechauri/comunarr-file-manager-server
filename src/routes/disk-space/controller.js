'use strict';

const fileUtility = require(`${global.__base}/src/utils/file.utility.js`);

module.exports = {
    GET: (request, reply) => {
        fileUtility.checkSpace().then(result => {
            reply({ freeSpace : result.freeSpace });
        });
    }
};