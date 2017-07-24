const db = require(`${global.__base}/src/middleware/db`);

/**
 * There are three kind of users(scopes): admin, member and user
 */
module.exports = {
    validate: (request, username, password, callback) => {
        db.getConnection((err, connection) => {

            const query = `SELECT * FROM user WHERE status = 1 && userName =${connection.escape(username)} && password=${connection.escape(password)}`;
            connection.query(query, {}, (error, results, fields) => {
                connection.release();

                if (error) throw error;

                if (results.length === 0) {
                    return callback(null, false);
                } else {
                    const user = results[0];
                    user.scope = (() => {
                        let scopes = [];
                        

                        switch (user.idUserType) {
                            case 1: scopes = ['admin', 'member', 'user'];  break;
                            case 2: scopes = ['member', 'user']; break;
                            case 3: scopes = ['user']; break;
                            default: break;
                        }
                        return scopes;
                    })();
                    callback(null, true, user);
                }

            });
        });
    }
};