-- DROP DATABASE IF EXISTS rawsdc;

-- CREATE DATABASE rawsdc;

-- /characteristic_reviews.csv
-- id
-- characteristic_id
-- review_id
-- value
DROP TABLE IF EXISTS characteristic_reviews;

CREATE TABLE characteristic_reviews (
  id integer PRIMARY KEY,
  characteristic_id integer,
  review_id integer,
  value integer
);


-- /questions.csv
-- id
-- product_id
-- body
-- date_written
-- asker_name
-- asker_email
-- reported
-- helpful

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id integer PRIMARY KEY,
  product_id integer,
  body varchar(255),
  date_written bigint,
  asker_name varchar(32),
  asker_email varchar(128),
  reported integer,
  helpful integer
);



-- /reviews.csv
-- id
-- product_id
-- rating
-- date
-- summary
-- body
-- recommend
-- reported
-- reviewer_name
-- reviewer_email
-- response
-- helpfulness

DROP TABLE IF EXISTS reviews;

CREATE TABLE reviews (
  id integer PRIMARY KEY,
  product_id integer,
  rating text,
  date bigint,
  summary varchar(255),
  body varchar(255),
  recommend boolean,
  reported boolean,
  reviewer_name varchar(32),
  reviewer_email varchar(128),
  response text,
  helpfulness integer
);


-- /styles.csv
-- id
-- productId
-- name
-- sale_price
-- original_price
-- default_style

DROP TABLE IF EXISTS styles;

CREATE TABLE styles (
  id integer PRIMARY KEY,
  productId integer,
  name varchar(32),
  sale_price varchar(32),
  original_price varchar(32),
  default_style text
);

-- /answers_photos.csv
-- id
-- answer_id
-- url

DROP TABLE IF EXISTS answers_photos;

CREATE TABLE answers_photos (
  id integer PRIMARY KEY,
  answer_id integer,
  url text
);

-- /answers.csv
-- id
-- question_id
-- body
-- date_written
-- answerer_name
-- answerer_email
-- reported
-- helpful

DROP TABLE IF EXISTS answers;

CREATE TABLE answers (
  id integer PRIMARY KEY,
  question_id integer,
  body varchar(255),
  date_written bigint,
  answerer_name varchar(32),
  answerer_email varchar(128),
  reported integer,
  helpful integer
);

-- /product.csv
-- id
-- name
-- slogan
-- description
-- category
-- default_price

DROP TABLE IF EXISTS product;

CREATE TABLE product (
  id integer PRIMARY KEY,
  name varchar(32),
  slogan varchar(255),
  description text,
  category varchar(64),
  default_price text
);


-- /reviews_photos.csv
-- id
-- review_id
-- url

DROP TABLE IF EXISTS reviews_photos;

CREATE TABLE reviews_photos (
  id integer PRIMARY KEY,
  review_id integer,
  url text
);


-- /cart.csv
-- id
-- user_session
-- product_id
-- active

DROP TABLE IF EXISTS cart;

CREATE TABLE cart (
  id integer PRIMARY KEY,
  user_session text,
  product_id integer,
  active boolean DEFAULT false
);


-- /characteristics.csv
-- id
-- product_id
-- name

DROP TABLE IF EXISTS characteristics;

CREATE TABLE characteristics (
  id integer PRIMARY KEY,
  product_id integer,
  name varchar(32)
);


-- /features.csv
-- id
-- product_id
-- feature
-- value

DROP TABLE IF EXISTS features;

CREATE TABLE features (
  id integer PRIMARY KEY,
  product_id integer,
  feature varchar(32),
  value varchar(32)
);


-- /photos.csv
-- id
-- styleId
-- url
-- thumbnail_url

DROP TABLE IF EXISTS photos;

CREATE TABLE photos (
  id integer PRIMARY KEY,
  styleId integer,
  url text,
  thumbnail_url text
);


-- /related.csv
-- id
-- current_product_id
-- related_product_id

DROP TABLE IF EXISTS related;

CREATE TABLE related (
  id integer PRIMARY KEY,
  current_product_id integer,
  related_product_id integer
);


-- /skus.csv
-- id
-- styleId
-- size
-- quantity

DROP TABLE IF EXISTS skus;

CREATE TABLE skus (
  id integer PRIMARY KEY,
  styleId integer,
  size varchar(12),
  quantity integer
);