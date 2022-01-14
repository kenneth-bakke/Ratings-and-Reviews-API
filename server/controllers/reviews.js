const model = require('../models');

module.exports = {
  getReviews: function(req, res) {
    const params = req.query;
    model.reviews.selectReviews(params, (err, reviews) => {
      if (err) {
        console.error(err);
        res.send(404);
      } else {
        res.status(200).send(reviews);
      }
    })
  },
  getMetaData: function(req, res) {
    const params = req.query;
    model.reviews.selectMetaData(params, (err, metaData) => {
      if (err) {
        console.error(err);
        res.send(404);
      } else {
        res.status(200).send(metaData);
      }
    })
  },
  postReview: function(req, res) {
    res.status(201).send(console.log('post review'));
  },
  markAsHelpful: function(req, res) {
    res.status(204).send(console.log('helpful'));
  },
  reportReview: function(req, res) {
    res.status(204).send(console.log('report'));
  }
}