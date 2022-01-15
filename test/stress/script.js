const http = require('k6/http');
const { sleep } = require('k6');

export const options = {
  vus: 10,
  duration: '30s',
}

export default function () {
  http.get('http://localhost:3002/api/reviews');
  sleep(1);
}