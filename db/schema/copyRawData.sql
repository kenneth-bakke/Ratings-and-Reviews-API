COPY product
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/product.csv'
DELIMITER ','
CSV HEADER;

COPY reviews
(
  id,
  product_id,
  rating,
  date,
  summary,
  body,
  recommend,
  reported,
  reviewer_name,
  reviewer_email,
  response,
  helpfulness
)
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/reviews.csv'
DELIMITER ','
CSV HEADER;



COPY reviews_photos
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/reviews_photos.csv'
DELIMITER ','
CSV HEADER;

COPY characteristics
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/characteristics.csv'
DELIMITER ','
CSV HEADER;

COPY characteristic_reviews
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/characteristic_reviews.csv'
DELIMITER ','
CSV HEADER;

-- COPY temporary
-- FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/reviews_photos.csv'
-- DELIMITER ','
-- CSV HEADER;

-- array_append(r.photos, string_to_array(t.url, '"'))
-- FROM temporary t
-- WHERE t.review_id = r.id
-- DROP TABLE t;


-- CREATE MATERIALIZED VIEW metadata AS
-- SELECT c.product_id, r.rating, r.recommend, c.name, cr.value, rp.url, rp.review_id
-- FROM characteristics c
-- JOIN reviews r
-- ON c.product_id = r.product_id
-- JOIN reviews_photos rp
-- ON rp.review_id = r.id
-- JOIN characteristic_reviews cr
-- ON cr.characteristic_id = c.id
-- GROUP BY c.product_id, r.rating, r.recommend, c.name, cr.value, rp.url, rp.review_id;