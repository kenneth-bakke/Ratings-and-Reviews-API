const http = require('k6/http');
const { check, sleep } = require('k6');

export const options = {
  stages: [
    { duration: '10s', target: 100 },
    { duration: '10s', target: 500 },
    { duration: '10s', target: 800 },
    { duration: '10s', target: 900 },
    { duration: '10s', target: 1000 },
    { duration: '30s', target: 0 },
  ]
}

export default function () {
  let res = http.get('http://localhost:3002/api/reviews', {
    page: 1,
    count: 5,
    sort: 'newest',
    product_id: 2
  });
  sleep(1);
  check(res, {
    'status was 200': (r) => r.status === 200
  });
}