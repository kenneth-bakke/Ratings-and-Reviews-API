const controller = require('./controllers');
const router = require('express').Router();

router.get('/products', controller.products.getProducts);
router.get('/products/:product_id', controller.products.getProduct);
router.get('/reviews', controller.reviews.getReviews);
router.get('/reviews/meta/:product_id', controller.reviews.getMetaData);
router.post('/reviews', controller.reviews.postReview);
router.put('/reviews/:review_id/helpful/', controller.reviews.markAsHelpful);
router.put('/reviews/:review_id/report/', controller.reviews.reportReview);
router.put('/reviews/:review_id/cancelReport/', controller.reviews.cancelReport);

module.exports = router;