const controller = require('./controllers');
const router = require('express').Router();

router.get('/products', controller.products.getProducts);
router.get('/reviews', controller.reviews.getReviews);
router.get('/reviews/meta', controller.reviews.getMetaData);
router.post('/reviews', controller.reviews.postReview);
router.put('/reviews/helpful/:review_id', controller.reviews.markAsHelpful);
router.put('/reviews/report/:review_id', controller.reviews.reportReview)

module.exports = router;