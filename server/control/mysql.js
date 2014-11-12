var mysql = require('mysql');

module.exports = connection = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'ing',
    password: 'hack',
    database: 'ing'
});