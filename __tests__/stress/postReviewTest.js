const http = require('k6/http');
const { check, sleep } = require('k6');

const URL = 'http://localhost:3002/api/reviews';
export const options = {
  stages: [
    { duration: '10s', target: 0 },
    { duration: '10s', target: 10 },
    // { duration: '10s', target: 100 },
    // { duration: '10s', target: 1000 },
    // { duration: '10s', target: 100 },
    // { duration: '10s', target: 10 },
    { duration: '10s', target: 0 },
  ]
}

export default function () {
  const mockId = Math.floor(Math.random() * (1000000 - 1 + 1)) + 1
  const body = {
    product_id: mockId,
    rating: 5,
    summary: 'This is a product that does things',
    body: 'Here is some more info on the product',
    recommend: true,
    reviewer_name: 'fmulder',
    reviewer_email: 'fmulder@xfiles.com'
  }
  let res = http.post(URL, body)
  sleep(1);
  check(res, {
    'status was 201': (r) => r.status === 201
  });
}