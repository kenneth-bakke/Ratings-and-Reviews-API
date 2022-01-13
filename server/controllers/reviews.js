const model = require('../models');

module.exports = {
  get: function(req, res) {
    console.log('doin thangs');
    model.test();
  }
}