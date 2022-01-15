const router = require('./routes.js');
const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const cors = require('cors');
const app = express();
const port = 3002;

app.use(cors());
// app.use(express.json());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use('/api', router);

app.listen(port, () => {
  console.log(`Listening on port: ${port}`)
})

module.exports = {
  app: app
}