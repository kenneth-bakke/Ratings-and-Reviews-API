const model = require('../models');

module.exports = {
  getProducts: function(req, res) {
    const page = req.body.page;
    const count = req.body.count;
    model.products.selectProducts(page, count, (err, products) => {
      if (err) console.error(err);
      else res.status(200).send(products);
    })
  }
}