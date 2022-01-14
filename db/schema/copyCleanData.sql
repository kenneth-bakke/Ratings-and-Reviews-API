COPY products
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/product.csv'
DELIMITER ','
CSV HEADER;

COPY characteristic_reviews
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/characteristic_reviews.csv'
DELIMITER ','
CSV HEADER;

COPY characteristics
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/characteristics.csv'
DELIMITER ','
CSV HEADER;

COPY reviews
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/reviews.csv'
DELIMITER ','
CSV HEADER;

-- COPY review_metadata
-- FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/formatted-data/review_metadata.csv'
-- DELIMITER ','
-- CSV HEADER;