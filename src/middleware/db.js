const mysql = require('mysql');
const constants = require(`${global.__base}/src/config/constants`);

module.exports = function () {
    const options = constants.database;
    const pool = mysql.createPool(options);

    return {
        getConnection: callback => {
            pool.getConnection((err, connection) => {
                callback(err, connection);
            });
        }
    };
}();