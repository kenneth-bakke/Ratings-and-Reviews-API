const controller = require('./controllers');
const router = require('express').Router();

router.get('/products', controller.products.getProducts);
router.get('/reviews', controller.reviews.getReviews);
router.get('/reviews/meta', controller.reviews.getMetaData);
router.post('/reviews', controller.reviews.postReview);
router.put('/reviews/helpful/', controller.reviews.markAsHelpful);
router.put('/reviews/report/', controller.reviews.reportReview);
router.put('/reviews/cancelReport/', controller.reviews.cancelReport);

module.exports = router;