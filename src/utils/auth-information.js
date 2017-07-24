module.exports = {
    GET_USER_ID : request => {
        return request.auth.credentials.id;
    }
};