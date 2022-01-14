const sql = require('../../db/index.js');

module.exports = {
  selectProducts: async function(page, count, callback) {
    try {
      // if (!page) page = 1; // Reference as an index
      if (!count) count = 5;
      const products = await sql`
        select id, name, slogan, description, category, default_price from product limit ${count};
      `
      callback(null, products);
    } catch (err) {
      callback(err, null);
    }
  }
}