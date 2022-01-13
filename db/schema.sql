-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'objects'
--
-- ---

-- DROP TABLE IF EXISTS objects;

-- CREATE TABLE objects (
--   id SERIAL DEFAULT NULL,
--   name VARCHAR NOT NULL DEFAULT 'NULL',
--   category SMALLINT NULL DEFAULT NULL,
--   main_foto VARCHAR NULL DEFAULT NULL,
--   photo INTEGER NULL DEFAULT NULL COMMENT 'array',
--   sheldule SMALLINT NULL DEFAULT NULL,
--   contact MEDIUMTEXT NULL DEFAULT NULL COMMENT 'array',
--   site VARCHAR NULL DEFAULT NULL,
--   supervision SMALLINT NULL DEFAULT NULL COMMENT 'array',
--   description MEDIUMTEXT NULL DEFAULT NULL,
--   active INTEGER NULL DEFAULT NULL COMMENT 'boolean',
--   city SMALLINT NOT NULL DEFAULT NULL,
--   longitude INTEGER NULL DEFAULT NULL,
--   PRIMARY KEY (id)
-- );

-- ---
-- Table 'review'
--
-- ---

DROP TABLE IF EXISTS reviews;

CREATE TABLE reviews (
  id SERIAL DEFAULT NULL PRIMARY KEY,
  -- product_id INTEGER NULL DEFAULT NULL REFERENCES product(id),
  review_id BIGSERIAL NULL DEFAULT NULL,
  rating TEXT NULL DEFAULT NULL,
  summary TEXT NULL DEFAULT NULL,
  recommend BOOLEAN NULL DEFAULT false,
  body TEXT NULL DEFAULT NULL,
  date BIGINT NULL DEFAULT NULL,
  reviewer_id INTEGER NULL REFERENCES reviewer(id),
  helpfulness INTEGER NULL DEFAULT NULL,
);

-- ---
-- Table 'review metadata'
--
-- ---

DROP TABLE IF EXISTS review metadata;

CREATE TABLE review metadata (
  id SERIAL NULL DEFAULT NULL,
  product_id INTEGER NULL DEFAULT NULL,
  recommend MEDIUMTEXT NULL DEFAULT NULL,
  rating INTEGER NULL DEFAULT NULL,
  id_recommend INTEGER NULL DEFAULT NULL,
  id_rating INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'characteristics'
--
-- ---

DROP TABLE IF EXISTS characteristics;

CREATE TABLE characteristics (
  id SERIAL NULL DEFAULT NULL,
  characteristic VARCHAR(64) NULL DEFAULT NULL,
  value DECIMAL NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'meta_characteristic_association'
-- Table for joining characteristics and metadata. Each characteristic may be applicable to many items and each item may have many characteristics
-- ---

DROP TABLE IF EXISTS meta_characteristic_association;

CREATE TABLE meta_characteristic_association (
  id INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  id_characteristics INTEGER NULL DEFAULT NULL,
  id_review meta data INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
) COMMENT 'Table for joining characteristics and metadata. Each charact';

-- ---
-- Table 'reviewer'
--
-- ---

DROP TABLE IF EXISTS reviewer;

CREATE TABLE reviewer (
  id SERIAL NULL DEFAULT NULL,
  name INTEGER NULL DEFAULT NULL,
  id_review INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'photos'
-- One review can have multiple photos, each photo is linked to only one review
-- ---

DROP TABLE IF EXISTS photos;

CREATE TABLE photos (
  id INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  url VARCHAR(128) NULL DEFAULT NULL,
  review_id INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
) COMMENT 'One review can have multiple photos, each photo is linked to';

-- ---
-- Table 'product'
--
-- ---

DROP TABLE IF EXISTS product;

CREATE TABLE product (
  id SERIAL NULL DEFAULT NULL,
  campus VARCHAR(20) NULL DEFAULT NULL,
  name VARCHAR(64) NULL DEFAULT NULL,
  slogan VARCHAR(128) NULL DEFAULT NULL,
  description VARCHAR(255) NULL DEFAULT NULL,
  category VARCHAR(32) NULL DEFAULT NULL,
  default_price DECIMAL NULL DEFAULT NULL,
  created_at DATE NULL DEFAULT NULL,
  updated_at DATE NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'features'
--
-- ---

DROP TABLE IF EXISTS features;

CREATE TABLE features (
  id INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  feature VARCHAR(32) NULL DEFAULT NULL,
  value VARCHAR(32) NULL DEFAULT NULL,
  id_product INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'recommend'
--
-- ---

DROP TABLE IF EXISTS recommend;

CREATE TABLE recommend (
  id INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  false INTEGER NULL DEFAULT NULL,
  true INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'rating'
--
-- ---

DROP TABLE IF EXISTS rating;

CREATE TABLE rating (
  id INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  1 INTEGER NULL DEFAULT NULL,
  2 INTEGER NULL DEFAULT NULL,
  3 INTEGER NULL DEFAULT NULL,
  4 INTEGER NULL DEFAULT NULL,
  5 INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE review metadata ADD FOREIGN KEY (id_recommend) REFERENCES recommend (id);
ALTER TABLE review metadata ADD FOREIGN KEY (id_rating) REFERENCES rating (id);
ALTER TABLE meta_characteristic_association ADD FOREIGN KEY (id_characteristics) REFERENCES characteristics (id);
ALTER TABLE meta_characteristic_association ADD FOREIGN KEY (id_review meta data) REFERENCES review metadata (id);
ALTER TABLE reviewer ADD FOREIGN KEY (id_review) REFERENCES review (id);
ALTER TABLE photos ADD FOREIGN KEY (review_id) REFERENCES review (id);
ALTER TABLE features ADD FOREIGN KEY (id_product) REFERENCES product (id);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE objects ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE review ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE review metadata ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE characteristics ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE meta_characteristic_association ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE reviewer ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE photos ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE product ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE features ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE recommend ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE rating ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO objects (id,name,category,main_foto,photo,sheldule,contact,site,supervision,description,active,city,longitude) VALUES
-- ('','','','','','','','','','','','','');
-- INSERT INTO review (id,review_id,rating,summary,recommend,body,date,helpfulness) VALUES
-- ('','','','','','','','');
-- INSERT INTO review metadata (id,product_id,recommend,rating,id_recommend,id_rating) VALUES
-- ('','','','','','');
-- INSERT INTO characteristics (id,characteristic,value) VALUES
-- ('','','');
-- INSERT INTO meta_characteristic_association (id,id_characteristics,id_review meta data) VALUES
-- ('','','');
-- INSERT INTO reviewer (id,name,id_review) VALUES
-- ('','','');
-- INSERT INTO photos (id,url,review_id) VALUES
-- ('','','');
-- INSERT INTO product (id,campus,name,slogan,description,category,default_price,created_at,updated_at) VALUES
-- ('','','','','','','','','');
-- INSERT INTO features (id,feature,value,id_product) VALUES
-- ('','','','');
-- INSERT INTO recommend (id,false,true) VALUES
-- ('','','');
-- INSERT INTO rating (id,1,2,3,4,5) VALUES
-- ('','','','','','');