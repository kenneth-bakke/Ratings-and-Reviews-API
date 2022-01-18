const http = require('k6/http');
const { check, sleep } = require('k6');

const URL = 'http://localhost:3002/api/reviews/meta';

export const options = {
  vus: 100,
  stages: [
    { duration: '30s', target: 20 },
    { duration: '1m30s', target: 10 },
    { duration: '20s', target: 0 },
  ]
}

export default function() {
  let res = http.get(URL, {product_id: 1});
  sleep(1);
  check(res, {
    'status was 200': (r) => r.status === 200
  });
}