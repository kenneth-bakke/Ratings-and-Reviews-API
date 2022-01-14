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
  selectMetaData: async function(params, callback) {
    const { product_id } = params;
    console.log(params);
    try {
      const metaData = await sql`
      SELECT c.name,
      json_build_object(
        'product_id', ${product_id},
        'recommended', json_build_object(

        )
      )
      FROM characteristics c
      INNER JOIN characteristic_reviews cr on cr.review_id = c.product_id
      INNER JOIN product p on p.id = c.product_id
      INNER JOIN reviews r on p.id = r.product_id
      `
      console.log(metaData);
    } catch (err) {
      console.error(err);
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
