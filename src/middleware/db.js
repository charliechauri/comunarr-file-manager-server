const mysql = require('mysql');
const constants = require(`${global.__base}/src/config/constants`);

module.exports = function () {
    const options = constants.database;
    const pool = mysql.createPool(options);

    return {
        query: (sql, values, callback) => {
            pool.getConnection((err, connection) => {

                connection.query(sql, values, (error, results, fields) => {
                    connection.release();
                    callback(results);
                    // Handle error after the release.
                    if (error) throw error;
                });

            });
        }
    };

}();