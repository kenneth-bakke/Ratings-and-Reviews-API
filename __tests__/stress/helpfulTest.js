const http = require('k6/http');
const { check, sleep } = require('k6');

const URL = `http://localhost:3002/api/reviews/${Math.floor(Math.random() * (1000000 - 1 + 1)) + 1}/helpful`;

export const options = {
  stages: [
    { duration: '10s', target: 0 },
    { duration: '10s', target: 10 },
    { duration: '10s', target: 100 },
    { duration: '10s', target: 1000 },
    { duration: '10s', target: 100 },
    { duration: '10s', target: 100 },
    { duration: '10s', target: 0 },
  ]
}

export default function() {
  let res = http.get(URL);
  sleep(1);
  check(res, {
    'status was 204': (r) => r.status === 204
  });
}