-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'review'
--
-- ---

DROP TABLE IF EXISTS reviews;

CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  product_id integer,
  rating integer,
  date bigint,
  summary text,
  body text,
  recommend boolean,
  reported boolean,
  reviewer_name text,
  reviewer_email text,
  response text,
  helpfulness integer,
  -- BEFORE LOAD WILL TRANSFORM THIS FROM reviews_photos.csv
  photos text[]
);

-- ---
-- Table 'product'
--
-- ---

DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  campus varchar(20),
  name varchar(64),
  slogan varchar(255),
  description varchar(255),
  category varchar(32),
  default_price decimal,
  created_at bigint,
  updated_at bigint
);
-- SELECT to_timestamp(1195374767) <- example conversion query


-- ---
-- Table 'characteristic_reviews'
--
-- ---

DROP TABLE IF EXISTS characteristic_reviews;

CREATE TABLE IF NOT EXISTS characteristic_reviews (
  id SERIAL PRIMARY KEY,
  characteristic_id integer,
  review_id integer,
  value integer
);

-- ---
-- Table 'characteristics'
--
-- ---

DROP TABLE IF EXISTS characteristics;

CREATE TABLE characteristics (
  id SERIAL PRIMARY KEY,
  product_id integer,
  name varchar(32)
);


-- ---
-- Table 'review metadata'
--
-- ---

DROP TABLE IF EXISTS review_metadata;

CREATE TABLE review_metadata (
  id SERIAL PRIMARY KEY,
  review_id integer,
  product_id integer,
  ratings json DEFAULT '{}'::json,
  recommend json DEFAULT '{}'::json,
  characteristics json DEFAULT '{}'::json
);


-- -- ---
-- -- Table 'recommend'
-- --
-- -- ---

-- DROP TABLE IF EXISTS recommend;

-- CREATE TABLE recommend (
--   id integer PRIMARY KEY,
--   product_d integer REFERENCES products(id),
--   false integer,
--   true integer
-- );

-- -- -- ---
-- -- -- Table 'rating'
-- -- --
-- -- -- ---

-- DROP TABLE IF EXISTS rating;

-- CREATE TABLE rating (
--   id integer PRIMARY KEY,
--   product_id integer REFERENCES products(id),
--   1 integer,
--   2 integer,
--   3 integer,
--   4 integer,
--   5 integer
-- );