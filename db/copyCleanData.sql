COPY reviews
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/formatted-data/reviews.csv'
DELIMITER ','
CSV HEADER;

COPY review_metadata
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/formatted-data/review_metadata.csv'
DELIMITER ','
CSV HEADER;

COPY products
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/formatted-data/products.csv'
DELIMITER ','
CSV HEADER;