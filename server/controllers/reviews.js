const model = require('../models');

module.exports = {
  getReviews: function(req, res) {
    const params = req.query;
    model.reviews.selectReviews(params, (err, reviews) => {
      if (err) {
        console.error(err);
        res.send(404);
      } else {
        console.log(req.rawHeaders);
        res.status(200).send(reviews);
      }
    })
  },
  postReview: function(req, res) {
    const params = req.body;
    model.reviews.insertReview(params, (err, photos, review_id) => {
      if (err) {
        console.error(err);
        res.status(404);
      } else {
        model.reviews.insertPhotos(photos, review_id, (err) => {
          if (err) {
            console.error(err)
          } else {
            res.status(201).send("Created");
          }
        })
      }
    })
  },
  getMetaData: function(req, res) {
    const {product_id} = req.params;
    model.reviews.createMetaData(product_id, (err, metaData) => {
      if (err) {
        console.error(err);
        res.status(404);
      } else {
        res.status(200).send(metaData);
      }
    })
  },
  markAsHelpful: function(req, res) {
    const {review_id} = req.params;
    model.reviews.markReviewAsHelpful(review_id, (err) => {
      if (err) {
        console.error(err);
        res.status(404);
      } else {
        res.status(204).send('Created');
      }
    })
  },
  reportReview: function(req, res) {
    const {review_id} = req.params;
    model.reviews.markReviewAsReported(review_id, (err) => {
      if (err) {
        console.error(err);
        res.status(404);
      } else {
        res.status(204).send('Created');
      }
    })
  },
  cancelReport: function(req, res) {
    const {review_id} = req.params;
    model.reviews.cancelReportReview(review_id, (err) => {
      if (err) {
        console.error(err);
        res.status(404);
      } else {
        res.status(204).send('Created');
      }
    })
  }
}