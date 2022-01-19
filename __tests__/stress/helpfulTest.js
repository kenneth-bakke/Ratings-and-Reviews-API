const http = require('k6/http');
const { check, sleep } = require('k6');

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
  const mockId = Math.floor(Math.random() * (1000000 - 1 + 1)) + 1
  const URL = `http://localhost:3002/api/reviews/${mockId}/helpful`;
  let res = http.put(URL);
  sleep(1);
  check(res, {
    'status was 204': (r) => r.status === 204
  });
}