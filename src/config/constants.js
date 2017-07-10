module.exports = function () {

    const dbContants = {
        host: '35.184.224.0',
        user: 'app',
        password: 'Comunarr2017',
        database: 'comunarr',
        multipleStatements: true
    };

    const constants = {
        fileDirectory: './files',
        database: dbContants
    };

    return constants;
}();