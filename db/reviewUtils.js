const sql = require('./index.js');

function loadMetadata() {
  sql`
    INSERT INTO metadata (product_id)
    VALUES (SELECT DISTINCT r.product_id FROM reviews r);
  `
}

loadMetadata()


































// Create a function createReviewMetadata that meets this data model
// {
//   product_id:        // reviews.csv
//   ratings: {         // '' increment each rating during read
//     1:
//     2:
//     3:
//     4:
//     5:
//   },
//   recommended: {     // '' increment each rating during read
//     "false":
//     "true":
//   },
//   characteristics: {
//     c.name: {        // characteristics.csv <- do a read on this first
//       c.id:          // ''
//       cr.value       // characteristic_reviews.csv <- then fill in the value during this read
//     }
//   }
// }

// Create a function createReview that meets this data model
// {
//   review_id:     // reviews.csv
//   rating:        // ''
//   summary:       // ''
//   recommend:     // ''
//   response:      // ''
//   body:          // ''
//   date:          // ''
//   reviewer_name: // ''
//   helpfulness:   // ''
//   photos: []     // reviews_photos.csv
// }