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
  postReview: function(req, res) {
    const params = req.query;
    model.reviews.insertReview(params, (err) => {
      if (err) {
        console.error(err);
        res.status(404);
      }
      res.status(201).send("Created");
    })
  },
  getMetaData: function(req, res) {
    const params = req.query;
    model.reviews.createMetaData(params, (err, metaData) => {
      if (err) {
        console.error(err);
        res.status(404);
      } else {
        res.status(200).send(metaData);
      }
    })
  },
  markAsHelpful: function(req, res) {
    const {review_id} = req.query;
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
    const {review_id} = req.query;
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
    const {review_id} = req.query;
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