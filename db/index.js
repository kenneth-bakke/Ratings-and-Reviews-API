const postgres = require('postgres');

const sql = postgres({'postgres://kenneth-bakke:skank4life@localhost:5432/rawsdc',
  host: 'localhost',
  port: 5432,
  path: '',
  database: '',
  username: '',
  password: '',
  max: 10,
  onnotice: console.log,
})

module.exports = sql;