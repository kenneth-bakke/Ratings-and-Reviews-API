const model = require('../models');

module.exports = {
  getProducts: function(req, res) {
    const page = req.body.page;
    const count = req.body.count;
    model.products.selectProducts(page, count, (err, products) => {
      if (err) console.error(err);
      else res.status(200).send(products);
    })
  },
  getProduct: function(req, res) {
    let {product_id} = req.params;
    product_id = Number(product_id);
    model.products.selectProduct(product_id, (err, product) => {
      if (err) {
        console.error(err)
        res.status(404)
      } else {
        res.status(200).send(product);
      }
    })
  },
  test: function(req, res) {
    res.status(200).send('Test successfull');
  }
}