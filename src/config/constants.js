module.exports = function () {

    const dbContants = {
        host: '',
        user: '',
        password: '',
        database: '',
        multipleStatements: true
    };

    const constants = {
        fileDirectory: './files',
        database: dbContants
    };

    return constants;
}();
