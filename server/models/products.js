const sql = require('../../db/index.js');

module.exports = {
  selectProducts: async function(page, count, callback) {
    try {
      if (!count) count = 5;
      const products = await sql`
        select id, name, slogan, description, category, default_price from product limit ${count};
      `
      callback(null, products);
    } catch (err) {
      callback(err, null);
    }
  },
  selectProduct: async function(product_id, callback) {
    try {
      const product = await sql`
        SELECT id, name, description, category, default_price
        FROM product
        WHERE product.id = ${product_id}
      `
      callback(null, product)
    } catch (err) {
      callback(err, null)
    }
  }
}