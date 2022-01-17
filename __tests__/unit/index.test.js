const request = require('supertest')

describe('Using the app', () => {
  let {server} = require('../../server/index.js');

  beforeEach(() => {
    console.log(server.close());
  });
  afterEach(() => {
    server.close();
  })
  it('Tests app', function testReviews(done) {
    request(server)
      .get('/api/reviews')
      .send({product_id: 2})
      .expect(200, done)
  });
  it('404 with no endpoint', function testSlash(done) {
    request(server)
      .get('/')
      .expect(404, done)
  })
});