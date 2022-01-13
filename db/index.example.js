const postgres = require('postgres');

// URL Format
// const sql = postgres({'postgres://kenneth-bakke:password@localhost:5432/dbName'})

// Object Format (overrides anything present in url)
const sql = postgres({
  host: 'localhost',
  port: 5432,
  path: '',
  database: '',
  username: '',
  password: '',
  max: 10,
  onnotice: console.log,

  // Other options
  // ssl         : false,      // True, or options for tls.connect
  // max         : 10,         // Max number of connections
  // timeout     : 0,          // Idle connection timeout in seconds
  // types       : [],         // Array of custom types, see more below
  // onnotice    : fn          // Defaults to console.log
  // onparameter : fn          // (key, value) when server param change
  // debug       : fn          // Is called with (connection, query, parameters)
  // transform   : {
  //   column            : fn, // Transforms incoming column names
  //   value             : fn, // Transforms incoming row values
  //   row               : fn  // Transforms entire rows
  // },
  // connection  : {
  //   application_name  : 'postgres.js', // Default application_name
  //   ...                                // Other connection parameters
  // }
})

module.exports = sql;