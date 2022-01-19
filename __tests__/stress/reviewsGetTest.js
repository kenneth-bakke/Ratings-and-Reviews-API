const http = require('k6/http');
const { check, sleep } = require('k6');


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

export default function () {
  const mockId = Math.floor(Math.random() * (1000000 - 1 + 1)) + 1
  let params = {
    page: 1,
    count: 100,
    sort: 'newest',
    product_id: mockId
  }
  let res = http.get(`http://localhost:3002/api/reviews?product_id=${params.product_id}&page=${params.page}&count=${params.count}&sort=${params.sort}`);
  sleep(1);
  check(res, {
    'status was 200': (r) => r.status === 200
  });
}