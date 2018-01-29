const del = require('del');
const diskspace = require('diskspace');
const copyFile = require('quickly-copy-file');
const constants = require(`${global.__base}/src/config/constants`);
const statusMessage = require(`${global.__base}/src/utils/request-status-message`);

const checkSpace = (size = 0) => {
    return new Promise(resolve => {
        diskspace.check('/', (error, result) => {
            resolve({ isEnoughSpace: result.free > (size * 2), freeSpace: result.free });
        });
    });
};

const generateQuery = obj => {
    let arrFilters = [];
    let filters = '';

    // File name filter
    if (obj.name) { arrFilters.push(`name LIKE "%${obj.name}%" `); }

    // Author filter
    if (obj.author.OR.length > 0) { arrFilters.push(formatORStringFilters('author', obj.author.OR)); }
    if (obj.author.NOT.length > 0) { arrFilters.push(formatNOTStringFilters('author', obj.author.NOT)); }

    // Place filter
    if (obj.place.OR.length > 0) { arrFilters.push(formatORStringFilters('place', obj.place.OR)); }
    if (obj.place.NOT.length > 0) { arrFilters.push(formatNOTStringFilters('place', obj.place.NOT)); }

    // Id filters
    let integerFilterNames = Object.keys(obj).filter(name => { return name.startsWith('id'); });

    for (let filter of integerFilterNames) {
        if (obj[filter].OR.length > 0) { arrFilters.push(formatORIntegerFilters(filter, obj[filter].OR)); }
        if (obj[filter].NOT.length > 0) { arrFilters.push(formatNOTIntegerFilters(filter, obj[filter].NOT)); }
    };

    // RelatedDate filter
    arrFilters.push(('(relatedDate IS NULL OR ').concat(formatDateFilters('relatedDate', obj.relatedDate)).concat(')'));

    // UpdateDate filter
    arrFilters.push(formatDateFilters('updateDate', obj.updateDate));

    // Key words filter
    if (obj.keyWords.OR.length > 0) { arrFilters.push(formatKeyWordORFilters(obj.keyWords.OR)); }
    if (obj.keyWords.AND.length > 0) { arrFilters.push(formatKeyWordANDFilters(obj.keyWords.AND)); }
    if (obj.keyWords.NOT.length > 0) { arrFilters.push(formatKeyWordNOTFilters(obj.keyWords.NOT)); }

    return filters.concat(arrFilters.join(' AND '));
};

const formatORStringFilters = (param, array) => array.map(item => `${param} LIKE "%${item}%"`).join(' OR ');

const formatNOTStringFilters = (param, array) => array.map(item => `${param} NOT LIKE "%${item}%"`).join(' AND ');

const formatORIntegerFilters = (param, array) => `${param} IN (`.concat(array.join(',')).concat(')');

const formatNOTIntegerFilters = (param, array) => `${param} NOT IN (`.concat(array.join(',')).concat(')');

const formatDateFilters = (param, array) => `${param} BETWEEN "${formatDate(array[0])}" AND "${formatDate(array[1])}"`;

const formatDate = param => param.toISOString().substring(0, 10);

const formatKeyWordORFilters = array => {
    return '('.concat(array.map(item => `EXISTS (SELECT * FROM comunarr.keyWord_file WHERE idFile = id AND idKeyWord = ${item})`).join(' OR ')).concat(')');
};

const formatKeyWordNOTFilters = array => {
    return array.map(item => `NOT EXISTS (SELECT * FROM comunarr.keyWord_file WHERE idFile = id AND idKeyWord = ${item})`).join(' AND ');
};

const formatKeyWordANDFilters = array => {
    return array.map(item => `EXISTS (SELECT * FROM comunarr.keyWord_file WHERE idFile = id AND idKeyWord = ${item})`).join(' AND ');
};

const prepareFile = (file, reply, connectToDatabase, isUpdate) => {
    // Set additional/optinal file object information
    file.keyWords = formatKeyWords(file);
    file = fillOptionalFields(file);

    if (isUpdate === 1 && !file.file) {
        connectToDatabase(file, file.name);
        return;
    }

    file.size = file.file.bytes;
    file.timestamp = getTimestamp();
    file.fileType = getFileExtension(file.file.filename);

    if (file.fileType === null || file.fileType === 'exe') {
        reply(statusMessage.BAD_REQUEST);
        return;
    }

    saveFile(file, connectToDatabase);
};

const saveFile = (file, connectToDatabase) => {
    // Define file name
    let newFileName = `${global.__base}/${constants.directories.files}/${file.timestamp}.${file.fileType}`;

    // Save file
    copyFile(file.file.path, newFileName)
        .then(() => {
            // Delete temp file
            deleteFile(file.file.path).catch(error => { throw error; });
            connectToDatabase(file, newFileName);
        })
        .catch(error => {
            if (error) {
                deleteFile(file.file.path).catch(error => { throw error; });
                throw error;
            }
        });
};

const deleteFile = fileName => del([fileName]).then(paths => paths);

const getTimestamp = () => (+new Date).toString();

const formatKeyWords = file => {
    if (!('keyWords' in file)) { return null; }
    return (file.keyWords.constructor === Array) ? file.keyWords.join(',') : file.keyWords;
};

const fillOptionalFields = file => {
    ['place', 'relatedDate', 'idSpecificTopic'].forEach(key => {
        file[key] = file[key] === undefined ? null : file[key];
    });
    return file;
};

const getFileExtension = filename => {
    let extension = filename.split('.');
    return (extension.length < 2 ? null : extension.pop().toLowerCase());
};

module.exports = {
    generateQuery,
    prepareFile,
    deleteFile,
    checkSpace
};