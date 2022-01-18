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


CREATE OR REPLACE VIEW metadata AS
SELECT c.product_id, c.name, r.rating, r.recommend, cr.value, rp.url, rp.review_id
FROM characteristics c
  JOIN (SELECT r.rating, r.recommend, r.product_id, r.id
        FROM reviews r
        GROUP BY id) r
  ON c.product_id = r.product_id
  JOIN (SELECT rp.url, rp.review_id
        FROM reviews_photos rp
        GROUP BY url, review_id) rp
  ON rp.review_id = r.id
  JOIN (SELECT cr.value, cr.characteristic_id
        FROM characteristic_reviews cr
        GROUP BY value, characteristic_id) cr
  ON cr.characteristic_id = c.id;

CREATE INDEX idx_reviews ON reviews (id);