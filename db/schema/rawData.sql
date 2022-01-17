DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS reviews_photos;
DROP TABLE IF EXISTS characteristics;
DROP TABLE IF EXISTS characteristic_reviews;
-- DROP TABLE IF EXISTS metadata;

-- CREATE TABLE temporary (id SERIAL, review_id integer, url text);

CREATE TABLE product (
  id SERIAL,
  name varchar(32),
  slogan varchar(255),
  description text,
  category varchar(64),
  default_price text,
  PRIMARY KEY (id)
);


CREATE TABLE reviews (
  id SERIAL,
  product_id integer references product (id),
  rating text,
  date bigint,
  summary text,
  body text,
  recommend boolean,
  reported boolean,
  reviewer_name text,
  reviewer_email text,
  response text,
  helpfulness integer,
  photos text[],
  PRIMARY KEY (id)
);


CREATE TABLE reviews_photos (
  id SERIAL,
  review_id integer,
  url text,
  PRIMARY KEY (id)
);


CREATE TABLE characteristics (
  id SERIAL,
  product_id integer references product (id),
  name varchar(32),
  PRIMARY KEY (id)
);


CREATE TABLE characteristic_reviews (
  id SERIAL,
  characteristic_id integer references characteristics (id),
  review_id integer references reviews (id),
  value integer,
  PRIMARY KEY (id)
);


CREATE MATERIALIZED VIEW metadata AS
SELECT c.product_id, r.rating, r.recommend, c.name, cr.value, rp.url, rp.review_id
FROM characteristics c
JOIN reviews r
ON c.product_id = r.product_id
JOIN reviews_photos rp
ON rp.review_id = r.id
JOIN characteristic_reviews cr
ON cr.characteristic_id = c.id
GROUP BY c.product_id, r.rating, r.recommend, c.name, cr.value, rp.url, rp.review_id;


-- CREATE TABLE metadata (
--   id SERIAL,
--   product_id integer,
--   review_id integer,
--   ratings -- Object with 1, 2, 3, 4, 5, type INT for each one
--   recommend -- Object with true, false, type INT for each one
--   characteristics -- Object with multiple characteristics
--                   -- where characteristic name as key, and value is another object
--                   -- comprised of characteristic_reviews id and characteristic_reviews value Averaged
-- )


-- CREATE MATERIALIZED VIEW ratings_and_recs_MV AS
--   SELECT product_id,
--     SUM (CASE WHEN recommend = true THEN 1 ELSE 0 END) AS true,
--     SUM (CASE WHEN recommend = false THEN 1 ELSE 0 END) AS false,
--     SUM (CASE WHEN rating = 1 THEN 1 ELSE 0 END) AS one,
--     SUM (CASE WHEN rating = 2 THEN 1 ELSE 0 END) AS two,
--     SUM (CASE WHEN rating = 3 THEN 1 ELSE 0 END) AS three,
--     SUM (CASE WHEN rating = 4 THEN 1 ELSE 0 END) AS four,
--     SUM (CASE WHEN rating = 5 THEN 1 ELSE 0 END) AS five
--   FROM reviews
--   GROUP BY product_id;