const sql = require('../../db/index.js');

module.exports = {
  selectReviews: async function(params, callback) {
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
      callback(null, params.photos, insertData[0].id);
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
  createMetaData: async function(params, callback) {
    const { product_id } = params;

    try {
      const characteristics = await sql`
        SELECT
          c.product_id,
          (SELECT row_to_json(_) from (SELECT c.name) as _) as characteristics
        FROM characteristics c
        WHERE c.product_id = ${product_id};
      `
      const photos = await sql`
        SELECT
          json_agg(json_build_object('id', rp.id, 'url', rp.url)) as photos
        FROM reviews_photos rp
        INNER JOIN reviews r
        ON r.id = rp.review_id
        WHERE r.product_id = ${product_id};
      `
      const characteristic_reviews = await sql`
        SELECT
          c.name,
          json_build_object('id', c.id, 'value', AVG(cr.value)) as details
        FROM characteristic_reviews cr
        INNER JOIN characteristics c
        ON c.id = cr.characteristic_id
        WHERE c.product_id = ${product_id}
        GROUP BY cr.id, c.id, c.name;
      `
      const ratingsAndRecommendations = await sql`
        SELECT
          r.rating, r.recommend
        FROM reviews r
        where r.product_id = ${product_id};
      `

      const metaData = {
        product_id: characteristics[0].product_id,
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

      const chars = characteristics.map(char => {
        return char.characteristics.name
      })

      chars.forEach(char => {
        metaData.characteristics[char] = {}
        characteristic_reviews.forEach(review => {
          if (review.name === char) {
            metaData.characteristics[char].id = review.details.id
            metaData.characteristics[char].value = review.details.value
          }
        })
      })

      ratingsAndRecommendations.forEach(rating => {
        metaData.ratings[rating.rating] = metaData.ratings[rating.rating] + 1
        metaData.recommended[rating.recommend] = metaData.recommended[rating.recommend] + 1
      })

      metaData.photos = photos[0].photos

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

// metaData final
// {
//   product_id: int,
//   ratings: {
//     1:
//     2:
//     3:
//     4:
//     5:
//   },
//   recommend: {
//     'true': int,
//     'false': int
//   },
//   characteristics: {
//     char1: string,
//     char2: string,
//     ...
//   }
// }
