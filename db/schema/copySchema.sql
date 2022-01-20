
COPY reviews
(
  id,
  product_id,
  rating,
  date,
  summary,
  body,
  recommend,
  reported,
  reviewer_name,
  reviewer_email,
  response,
  helpfulness
)
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/reviews.csv'
DELIMITER ','
CSV HEADER  ;

COPY reviews_photos
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/reviews_photos.csv'
DELIMITER ','
CSV HEADER;

COPY characteristics
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/characteristics.csv'
DELIMITER ','
CSV HEADER;

COPY characteristic_reviews
FROM '/Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone/ratings-and-reviews-api/db/clean-data/characteristic_reviews.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE metadata AS
  SELECT c.product_id, c.name, cr.value, cr.characteristic_id, r.rating, r.recommend, rp.review_id
    FROM characteristics c
      JOIN (SELECT r.rating, r.recommend, r.product_id, r.id
            FROM reviews r
            GROUP BY id) r
      ON c.product_id = r.product_id
      JOIN (SELECT rp.review_id
            FROM reviews_photos rp
            GROUP BY url, id, review_id) rp
      ON rp.review_id = r.id
      JOIN (SELECT cr.value, cr.characteristic_id
            FROM characteristic_reviews cr
            GROUP BY value, characteristic_id) cr
      ON cr.characteristic_id = c.id;

UPDATE reviews
SET photos =  array_append(photos, (
      SELECT json_build_object("id", reviews_photos.id, "url", reviews_photos.url)
            FROM reviews_photos
            WHERE reviews_photos.review_id = (
                  SELECT id FROM reviews
            )
      )
);


DROP TABLE characteristic_reviews;
DROP TABLE characteristics;
CREATE INDEX idx_meta ON metadata (product_id, review_id);
-- Location for sdc-dbms ec2
-- /home/ubuntu/sdc/ratings-and-reviews-api/db/clean-data

-- Location for dev
-- /Users/kenneth-bakke/Documents/hack reactor/senior-phase/system-design-capstone

-- Generic path example
-- /home/user/data/filename.csv