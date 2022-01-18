const http = require('k6/http');
const { sleep, check } = require('k6');
import reviewsGetTest from './reviewsGetTest.js';
import metaDataGetTest from './metaDataGetTest.js';


export default function() {
  reviewsGetTest();
  metaDataGetTest();
};