module.exports = function () {

    const constants = {
        database: {
            host: process.env.DATABASE_HOST,
            user: process.env.DATABASE_USER,
            password: process.env.DATABASE_PASSWORD,
            database: process.env.DATABASE_SCHEMA,
            multipleStatements: true
        },
        directories: {
            files: process.env.FILES_DIRECTORY,
            tempFiles: process.env.TEMP_FILES_DIRECTORY
        }
    };
 
    return constants;
}();
