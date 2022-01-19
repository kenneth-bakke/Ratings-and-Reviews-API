const sql = require('../../db/index.js');

module.exports = {
  selectProducts: async function(page, count, callback) {
    try {
      // if (!count) count = 5;
      // const products = await sql`
      //   select id, name, slogan, description, category, default_price from product limit ${count};
      // `
      // callback(null, products);

      const products = [
        {
              "id": 1,
              "name": "Camo Onesie",
              "slogan": "Blend in to your crowd",
              "description": "The So Fatigues will wake you up and fit you in. This high energy camo will have you blending in to even the wildest surroundings.",
              "category": "Jackets",
              "default_price": "140"
          },
        {
              "id": 2,
              "name": "Bright Future Sunglasses",
              "slogan": "You've got to wear shades",
              "description": "Where you're going you might not need roads, but you definitely need some shades. Give those baby blues a rest and let the future shine bright on these timeless lenses.",
              "category": "Accessories",
              "default_price": "69"
          },
        {
              "id": 3,
              "name": "Morning Joggers",
              "slogan": "Make yourself a morning person",
              "description": "Whether you're a morning person or not. Whether you're gym bound or not. Everyone looks good in joggers.",
              "category": "Pants",
              "default_price": "40"
          },
      ]
      callback(null, products);
    } catch (err) {
      callback(err, null);
    }
  },
  selectProduct: async function(product_id, callback) {
    try {
      // const product = await sql`
      //   SELECT id, name, description, category, default_price
      //   FROM product
      //   WHERE product.id = ${product_id}
      // `
      // callback(null, product)
      const product = {
        "id": 1,
        "name": "Camo Onesie",
        "slogan": "Blend in to your crowd",
        "description": "The So Fatigues will wake you up and fit you in. This high energy camo will have you blending in to even the wildest surroundings.",
        "category": "Jackets",
        "default_price": "140"
      }
      callback(null, product);
    } catch (err) {
      callback(err, null)
    }
  }
}