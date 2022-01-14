// const csv = require('csv-parser');
const csv = require('csv')
const fs = require('fs');
const sql = require('./index.js');

const path = require('path');
const dir = path.join(__dirname + '/clean-data/')

const records = [];

fs.createReadStream(dir + 'characteristics.csv')
.pipe(csv.parse({
  delimiter: ','
}))
.pipe(csv.transform(record => {
  console.log(record);
  const [id, product_id, name] = record;
  sql`
    INSERT INTO characteristics c
    (id, product_id, characteristic)
    VALUES
    (${id}, ${product_id}, '{${name}: }')
    WHERE c.product_id = ${product_id}
  `
}))
.pipe(csv.stringify({
  quoted: true
}))
.pipe(process.stdout);

// fs.createReadStream(dir + 'reviews.csv')
// .pipe(csv.parse({
//     delimiter: ',',
// }))
// .pipe(csv.transform(record => {

//   const metaData = {
//     product_id: null,
//     ratings: {
//       1: null,
//       2: null,
//       3: null,
//       4: null,
//       5: null
//     },
//     recommended: {
//       "false": null,
//       "true": null
//     },
//     characteristics: {

//     }
//   };
//   console.log('RECORD', record);
//   // Filter records based on header?
// }))
// .pipe(csv.stringify({
//   quoted: true
// }))
// .pipe(process.stdout)