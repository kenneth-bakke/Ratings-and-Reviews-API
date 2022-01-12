
COPY characteristic_reviews
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/data/clean-data-1/characteristic_reviews.csv'
DELIMITER ','
CSV HEADER;

COPY questions
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/data/clean-data-1/questions.csv'
DELIMITER ','
CSV HEADER;

COPY reviews
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/data/clean-data-2/reviews.csv'
DELIMITER ','
CSV HEADER;

COPY styles
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/data/clean-data-2/styles.csv'
DELIMITER ','
CSV HEADER;

COPY answers_photos
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/data/clean-data-3/answers_photos.csv'
DELIMITER ','
CSV HEADER;

COPY answers
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/data/clean-data-3/answers.csv'
DELIMITER ','
CSV HEADER;

COPY product
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/data/clean-data-3/product.csv'
DELIMITER ','
CSV HEADER;

COPY reviews_photos
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/data/clean-data-3/reviews_photos.csv'
DELIMITER ','
CSV HEADER;

COPY cart
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/data/clean-data-4/cart.csv'
DELIMITER ','
CSV HEADER;

COPY characteristics
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/data/clean-data-4/characteristics.csv'
DELIMITER ','
CSV HEADER;

COPY features
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/data/clean-data-4/features.csv'
DELIMITER ','
CSV HEADER;

COPY photos
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/data/clean-data-4/photos.csv'
DELIMITER ','
CSV HEADER;

COPY related
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/data/clean-data-4/related.csv'
DELIMITER ','
CSV HEADER;

COPY skus
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/data/clean-data-4/skus.csv'
DELIMITER ','
CSV HEADER;

-- Template
-- COPY
-- FROM ''
-- DELIMITER ','
-- CSV HEADER;