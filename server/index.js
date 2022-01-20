const express = require('express');
const app = express();
const server = require('http').createServer(app);
const bodyParser = require('body-parser');
const path = require('path');
const cors = require('cors');
const router = require('./routes.js');
const loaderio = 'loaderio-a68baefec179e56a0da846de453e9b55'
const port = 3002;

app.use(cors());
// app.use(express.json());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use('/api', router);
app.get('/loaderio-a68baefec179e56a0da846de453e9b55.txt', (req, res) => {
  res.send('loaderio-a68baefec179e56a0da846de453e9b55')
})

server.listen(port, "0.0.0.0", () => {
  console.log(`Listening on port: ${port}`)
})

module.exports = {
  app: app,
  server: server
}
