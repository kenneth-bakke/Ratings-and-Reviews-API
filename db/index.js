const postgres = require('postgres');

// 'postgres://kenneth-bakke:skank4life@localhost:5432/rawsdc',
const sql = postgres({
  host: 'localhost',
  port: 5432,
  path: '',
  database: 'rawsdc',
  username: 'kenneth-bakke',
  password: 'skank4life',
  max: 10,
  onnotice: console.log,
})


module.exports = sql;