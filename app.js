// Import the express module
const express = require('express');

// Create an express application
const app = express();

// Define the port where the server will listen
const port = 3000;

// Define a simple route to respond to requests at the root URL
app.get('/', (req, res) => {
  res.send('Hello from the Task Management App!');
});

// Make the server listen on the defined port
app.listen(port, '0.0.0.0', () => {
  console.log(`Task Management app listening at http://localhost:${port}`);
});
