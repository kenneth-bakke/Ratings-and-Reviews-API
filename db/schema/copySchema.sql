
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
CSV HEADER  ;

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

-- Location for sdc-dbms ec2
-- /home/ubuntu/sdc/ratings-and-reviews-api/db/clean-data

-- Location for dev
-- /Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone

-- Generic path example
-- /home/user/data/filename.csv