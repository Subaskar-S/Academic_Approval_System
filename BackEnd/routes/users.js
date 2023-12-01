// ./routes/users.js
const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt'); // Import bcrypt to hash and compare passwords

// Import the database connection (Replace this with the correct path to your database connection file)
const connection = require('/db');

// User login route
router.post('/login', (req, res) => {
  const { username, password } = req.body;

  // Validate user credentials (You can add more validation checks here if needed)
  if (!email || !password) {
    return res.status(400).json({ error: 'Email and password are required.' });
  }

  // Query the database to find the user with the provided username
  connection.query(
    'SELECT * FROM users WHERE username = ?',
    [email],
    (err, results) => {
      if (err) {
        console.error('Error querying the database:', err);
        return res.status(500).json({ error: 'Failed to login. Please try again later.' });
      }

      // Check if a user with the provided username exists
      if (results.length === 0) {
        return res.status(404).json({ error: 'User not found. Please check your username.' });
      }

      const user = results[0]; // The first result from the database (assuming username is unique)

      // Compare the provided password with the hashed password stored in the database
      bcrypt.compare(password, user.password, (bcryptErr, isMatch) => {
        if (bcryptErr) {
          console.error('Error comparing passwords:', bcryptErr);
          return res.status(500).json({ error: 'Failed to login. Please try again later.' });
        }

        // If passwords match, the user is authenticated
        if (isMatch) {
          // Generate a JWT token with the user ID and a secret key
          const token = jwt.sign({ userId: user.id }, 'your_secret_key_here', {
            expiresIn: '1h', // Token expiration time (e.g., 1 hour)
          });

          // Respond to the client with the JWT token
          return res.json({ message: 'Login successful!', token: token });
        } else {
          return res.status(401).json({ error: 'Invalid password. Please check your password.' });
        }
      });
    }
  );
});



module.exports = router;
