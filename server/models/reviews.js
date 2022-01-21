const sql = require('../../db/index.js');

module.exports = {
  selectReviews: async function(params, callback) {
    const { page, count, sort, product_id } = params;
    const limit = count;
    if (page && page > 1) {count *= page }
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
        INNER JOIN reviews_photos rp ON r.id = rp.review_id
        WHERE r.product_id = ${product_id}
        GROUP BY ${sql(columns)}
        ORDER BY ${sort}
        OFFSET ${count}
        LIMIT ${limit};
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
      SELECT
          m.product_id,
          array_agg(m.characteristic_id) as characteristic_id,
          array_agg(m.name) as characteristics,
          array_agg(m.value) as values,
          array_agg(m.rating) as ratings,
          array_agg(m.recommend) as recommended
      FROM metadata m
      WHERE m.product_id = ${product_id}
      GROUP BY (m.product_id, m.review_id)
      ORDER BY m.review_id;
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

const buildMetaData = function(reviewData, product_id) {
  const metaData =  {
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
  }

  if (reviewData && reviewData.length > 0) {

    reviewData.forEach(review => {
      const characteristicValues = review.values;
      const reviewRating = Number(review.ratings[0]);
      const reviewRecommendation = review.recommended[0];

      let avgCounter = 0;
      let avgSum = 0;
      let cAvg = 0
      // iterate through characteristics
      review.characteristics.forEach((characteristic, i) => {
        // if characteristic is the same as the next characteristic
        if (review.characteristics[i + 1] === characteristic) {
          // add the value at the same index to the sum and add 1 to the counter
          avgSum += review.values[i];
          avgCounter++
        // if characteristic is not the same as the next characteristic
        } else {
          // calculate the average
          cAvg = avgSum / avgCounter
          // set that characteristic as a key with and object containig it's id and avg to metadata.characteristics object
          metaData.characteristics[characteristic] = {
            id: review.characteristic_id[0],
            value: cAvg
          };
        }
      })

      metaData.ratings[reviewRating] = metaData.ratings[reviewRating] + 1;
      metaData.recommended[reviewRecommendation] = metaData.recommended[reviewRecommendation] + 1;
    });
  }
  return metaData;
}
