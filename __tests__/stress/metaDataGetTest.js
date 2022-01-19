const http = require('k6/http');
const { check, sleep } = require('k6');

const mockId = Math.floor(Math.random() * (1000000 - 1 + 1)) + 1
const URL = `http://localhost:3002/api/reviews/meta/${mockId}`;

export const options = {
  stages: [
    { duration: '10s', target: 1 },
    { duration: '10s', target: 10 },
    { duration: '10s', target: 100 },
    // { duration: '10s', target: 1000 },
    // { duration: '10s', target: 100 },
    // { duration: '10s', target: 10 },
    { duration: '30s', target: 0 },
  ]
}

const params = {
  body: {
    product_id: mockId
  },
  headers: {
    'Content-Type': 'application/json'
  }
}

export default function() {
  let res = http.get(URL);
  sleep(1);
  check(res, {
    'status was 200': (r) => r.status === 200
  });
}