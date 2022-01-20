DROP TABLE IF EXISTS reviews CASCADE;
DROP TABLE IF EXISTS reviews_photos CASCADE;
DROP TABLE IF EXISTS characteristics CASCADE;
DROP TABLE IF EXISTS characteristic_reviews CASCADE;
DROP VIEW IF EXISTS metadata CASCADE;

CREATE TABLE reviews (
  id SERIAL,
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
  helpfulness integer,
  photos json,
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
  product_id integer,
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

CREATE INDEX idx_reviews_id ON reviews (id);
CREATE INDEX idx_reviews_product ON reviews (product_id);
CREATE INDEX idx_review_photo_id ON reviews_photos (review_id);
CREATE INDEX idx_characteristics ON characteristics (product_id);
CREATE INDEX idx_characteristic_reviews_id ON characteristic_reviews (characteristic_id);
