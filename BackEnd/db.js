const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost', // e.g., 'localhost'
  user: 'root', // e.g., 'root'
  password: '', // Enter your MySQL password
  database: 'test', // Enter the name of your database
});

module.exports = connection;
