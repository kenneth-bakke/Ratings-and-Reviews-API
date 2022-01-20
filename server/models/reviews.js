const sql = require('../../db/index.js');

module.exports = {
  selectReviews: async function(params, callback) {
    console.log(params);
    const { page, count, sort, product_id } = params;
    try {
      const columns = [
        'product_id',
        'rating',
        'summary',
        'recommend',
        'body',
        'date',
        'reviewer_name',
        'reported',
        'helpfulness',
      ]
      const reviews = await sql`
        SELECT
          ${sql(columns)},
          jsonb_agg(jsonb_build_object('id', rp.id, 'url', rp.url)) as photos
        FROM reviews r
        INNER JOIN reviews_photos rp ON r.id = rp.id
        WHERE r.product_id = ${product_id}
        GROUP BY ${sql(columns)}
        ORDER BY ${sort}
        LIMIT ${count}
      `
      const formattedData = {
        product: product_id,
        // Add logic for page
        page: page,
        count: count,
        results: reviews,
      }
      callback(null, formattedData);
    } catch (err) {
      console.error(err);
    }

  },
  insertReview: async function(params, callback) {
    let review = {
      product_id: Number(params.product_id),
      rating: Number(params.rating),
      summary: params.summary,
      body: params.body,
      recommend: Boolean(params.recommend),
      reviewer_name: params.name,
      reviewer_email: params.email
    }
    try {
      const insertData = await sql`
        INSERT INTO reviews
        ${sql(review)}
        ON CONFLICT DO NOTHING
        RETURNING reviews.id;
      `
      callback(null, params.photos, params.product_id);
    } catch (err) {
      callback(err);
    }

  },
  insertPhotos: async function(photos, review_id, callback) {
    if (photos) {
      try {
        await sql`
          INSERT INTO reviews_photos
          ${photos}
          ON CONFLICT DO NOTHING;
        `
        callback(null);
      } catch (err) {
        callback(err);
      }
    } else {
      callback(null);
    }
  },
  createMetaData: async function(product_id, callback) {
    try {

      const characteristics = await sql`
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
        ON cr.characteristic_id = c.id
        WHERE r.product_id = ${product_id};
      `

      const metaData = buildMetaData(characteristics, product_id);

      callback(null, metaData);
    } catch (err) {
      callback(err, null);
    }
  },
  markReviewAsHelpful: async function(review_id, callback) {
    try {
      await sql`
        UPDATE reviews r
        SET helpfulness = helpfulness + 1
        WHERE r.id = ${review_id}
      `
      callback(null);
    } catch (err) {
      callback(err);
    }
  },
  markReviewAsReported: async function(review_id, callback) {
    try {
      await sql`
        UPDATE reviews r
        SET reported = true
        WHERE r.id = ${review_id}
      `
      callback(null);
    } catch (err) {
      callback(err);
    }
  },
  cancelReportReview: async function(review_id, callback) {
    try {
      await sql`
        UPDATE reviews r
        SET reported = false
        WHERE r.id = ${review_id}
      `
      callback(null);
    } catch (err) {
      callback(err);
    }
  }
}

const buildMetaData = function(characteristics, product_id) {
  const metaData = {
    product_id: product_id,
    ratings: {
      1: 0,
      2: 0,
      3: 0,
      4: 0,
      5: 0
    },
    recommended: {
      false: 0,
      true: 0
    },
    characteristics: {},
    photos: []
  }

  if (characteristics && characteristics.length > 0) {
    let currentReview = null;
    let photoCount = 0;
    characteristics.forEach(characteristic => {
      if (characteristic.review_id !== currentReview) {
        currentReview = characteristic.review_id;
        photoCount = 0;
      }
      const currentRating = Number(characteristic.rating);
      const currentRecommendation = characteristic.recommend;
      const currentCharacteristic = characteristic.name;
      const avgCharacteristicValue = characteristic.avg;
      const currentPhotoUrl = characteristic.url;

      metaData.ratings[currentRating] = metaData.ratings[currentRating] + 1;
      metaData.recommended[currentRecommendation] = metaData.recommended[currentRecommendation] + 1;
      metaData.characteristics[currentCharacteristic] = {
        id: product_id,
        value: avgCharacteristicValue
      };
      metaData.photos.push({
        id: photoCount + 1,
        url: currentPhotoUrl
        });
      photoCount++;
    });
  }

  return metaData;
}
