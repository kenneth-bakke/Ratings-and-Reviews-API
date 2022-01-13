const controller = require('./controllers');
const router = require('express').Router();

router.get('/reviews', controller.reviews.get);

module.exports = router;