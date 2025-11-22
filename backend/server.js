const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/api/hello', (req, res) => {
  res.json({ message: 'Hello from Node.js backend!', build: process.env.BUILD_NUMBER || 'local' });
});

app.listen(port, () => {
  console.log(`Backend listening on ${port}`);
});
