DROP TABLE IF EXISTS characteristic_reviews;

CREATE TABLE characteristic_reviews (
  id integer PRIMARY KEY,
  characteristic_id integer,
  review_id integer,
  value integer
);

DROP TABLE IF EXISTS reviews;

CREATE TABLE reviews (
  id integer PRIMARY KEY,
  product_id integer,
  rating text,
  date bigint,
  summary text,
  body text,
  recommend boolean,
  reported boolean,
  reviewer_name text,
  reviewer_email text,
  response text,
  helpfulness integer
);

DROP TABLE IF EXISTS product;

CREATE TABLE product (
  id integer PRIMARY KEY,
  name varchar(32),
  slogan varchar(255),
  description text,
  category varchar(64),
  default_price text
);

DROP TABLE IF EXISTS reviews_photos;

CREATE TABLE reviews_photos (
  id integer PRIMARY KEY,
  review_id integer,
  url text
);

DROP TABLE IF EXISTS characteristics;

CREATE TABLE characteristics (
  id integer PRIMARY KEY,
  product_id integer,
  name varchar(32)
);