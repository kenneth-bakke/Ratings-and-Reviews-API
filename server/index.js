const router = require('./routes.js');
const express = require('express');
const path = require('path');
const cors = require('cors');
const app = express();
const port = 3000;

app.use(cors());
app.use('/api', router);
app.use(express.json());

app.listen(port, () => {
  console.log(`Listening on port: ${port}`)
})