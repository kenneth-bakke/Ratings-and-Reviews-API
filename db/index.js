const postgres = require('postgres');
require('dotenv').config()

// 'postgres://kenneth-bakke:skank4life@localhost:5432/rawsdc',
const sql = process.env.NODE_ENV === 'production'
    ? postgres({
  host: 'localhost',
  port: 5432,
  path: '',
  database: 'rawsdc',
  username: 'kenneth-bakke',
  password: 'skank4life',
  max: 10,
  onnotice: console.log,
  ssl: { rejectUnauthorized: false }
})
    : postgres({
  host: 'localhost',
  port: 5432,
  path: '',
  database: 'rawsdc',
  username: 'kenneth-bakke',
  password: 'skank4life',
  max: 10,
  onnotice: console.log,
})

console.log('Connected to PostgreSQL on port 5432')
module.exports = sql;

