
COPY characteristic_reviews
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/characteristic_reviews.csv'
DELIMITER ','
CSV HEADER;

COPY questions
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/questions.csv'
DELIMITER ','
CSV HEADER;

COPY reviews
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/reviews.csv'
DELIMITER ','
CSV HEADER;

COPY styles
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/styles.csv'
DELIMITER ','
CSV HEADER;

COPY answers_photos
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/answers_photos.csv'
DELIMITER ','
CSV HEADER;

COPY answers
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/answers.csv'
DELIMITER ','
CSV HEADER;

COPY product
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/product.csv'
DELIMITER ','
CSV HEADER;

COPY reviews_photos
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/reviews_photos.csv'
DELIMITER ','
CSV HEADER;

COPY cart
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/cart.csv'
DELIMITER ','
CSV HEADER;

COPY characteristics
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/characteristics.csv'
DELIMITER ','
CSV HEADER;

COPY features
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/features.csv'
DELIMITER ','
CSV HEADER;

COPY photos
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/photos.csv'
DELIMITER ','
CSV HEADER;

COPY related
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/related.csv'
DELIMITER ','
CSV HEADER;

COPY skus
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/skus.csv'
DELIMITER ','
CSV HEADER;

-- Template
-- COPY
-- FROM ''
-- DELIMITER ','
-- CSV HEADER;