const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const mysql = require('mysql2');

//const express = require('express');
const app = express();

const loginController = require('./controllers/login');

app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


// Start the server
const PORT = 3000; //  port number for the backend server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});

app.get('/api/test', (req, res) => {
    res.json({ message: 'Backend API is working!' });
  });

  const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'test',
  });
  
  connection.connect((err) => {
    if (err) {
      console.error('Error connecting to the database:', err);
    } else {
      console.log('Connected to the database!');
    }
  });
  
  