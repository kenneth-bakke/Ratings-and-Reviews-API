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
  id SERIAL NULL DEFAULT NULL PRIMARY KEY,
  product_id INTEGER NULL DEFAULT NULL REFERENCES products(id),
  rating INTEGER(5) NULL DEFAULT NULL,
  summary VARCHAR(255) NULL DEFAULT NULL,
  recommend TINYINT NULL DEFAULT NULL,
  response TEXT NULL DEFAULT NULL,
  body VARCHAR(255) NULL DEFAULT NULL,
  date BIGINT NULL DEFAULT NULL,
  helpfulness INTEGER NULL DEFAULT NULL,
  photos TEXT[] NULL DEFAULT NULL
);

-- ---
-- Table 'review metadata'
--
-- ---

DROP TABLE IF EXISTS review metadata;

CREATE TABLE review metadata (
  id SERIAL NULL DEFAULT NULL PRIMARY KEY,
  review_id INTEGER NULL DEFAULT NULL REFERENCES reviews(id),
  recommend json NOT NULL DEFAULT '{}'::json,
  ratings json NOT NULL DEFAULT '{}'::json,
  characteristic json NOT NULL DEFAULT '{}'::json
);

-- ---
-- Table 'product'
--
-- ---

DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id SERIAL NULL DEFAULT NULL PRIMARY KEY,
  campus VARCHAR(20) NULL DEFAULT NULL,
  name VARCHAR(64) NULL DEFAULT NULL,
  slogan VARCHAR(128) NULL DEFAULT NULL,
  description VARCHAR(255) NULL DEFAULT NULL,
  category VARCHAR(32) NULL DEFAULT NULL,
  default_price DECIMAL NULL DEFAULT NULL,
  created_at BIGINT NULL DEFAULT NULL,
  updated_at BIGINT NULL DEFAULT NULL
);


-- -- ---
-- -- Table 'recommend'
-- --
-- -- ---

-- DROP TABLE IF EXISTS recommend;

-- CREATE TABLE recommend (
--   id SERIAL NULL DEFAULT NULL PRIMARY KEY,
--   review_id INTEGER NULL DEFAULT NULL,
--   false INTEGER NULL DEFAULT NULL,
--   true INTEGER NULL DEFAULT NULL
-- );

-- -- ---
-- -- Table 'rating'
-- --
-- -- ---

-- DROP TABLE IF EXISTS rating;

-- CREATE TABLE rating (
--   id SERIAL NULL DEFAULT NULL PRIMARY KEY,
--   1 INTEGER NULL DEFAULT NULL,
--   2 INTEGER NULL DEFAULT NULL,
--   3 INTEGER NULL DEFAULT NULL,
--   4 INTEGER NULL DEFAULT NULL,
--   5 INTEGER NULL DEFAULT NULL
-- );

-- ---
-- Foreign Keys
-- ---

ALTER TABLE review metadata ADD FOREIGN KEY (id_recommend) REFERENCES recommend (id);
ALTER TABLE review metadata ADD FOREIGN KEY (id_rating) REFERENCES rating (id);
ALTER TABLE features ADD FOREIGN KEY (id_product) REFERENCES product (id);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE objects ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE review ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE review metadata ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE product ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE features ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE recommend ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE rating ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO objects (id,name,category,main_foto,photo,sheldule,contact,site,supervision,description,active,city,longitude) VALUES
-- ('','','','','','','','','','','','','');
-- INSERT INTO review (id,product_id,rating,summary,recommend,body,date,helpfulness,photos) VALUES
-- ('','','','','','','','','');
-- INSERT INTO review metadata (id,product_id,recommend,rating,id_recommend,id_rating,characteristic) VALUES
-- ('','','','','','','');
-- INSERT INTO product (id,campus,name,slogan,description,category,default_price,created_at,updated_at) VALUES
-- ('','','','','','','','','');
-- INSERT INTO features (id,feature,value,id_product) VALUES
-- ('','','','');
-- INSERT INTO recommend (id,false,true) VALUES
-- ('','','');
-- INSERT INTO rating (id,1,2,3,4,5) VALUES
-- ('','','','','','');