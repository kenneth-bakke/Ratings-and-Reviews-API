const sql = require('../../db/index.js');

module.exports = {
  test: async function() {
    try {
      const tables = await sql`
        SELECT id FROM reviews limit 10;
      `
      console.log(tables);
    } catch (err) {
      console.error(err);
    }
  }
}