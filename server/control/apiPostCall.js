var http = require('http');
var _ = require('underscore');
var querystring = require('querystring');

var apikey = 'tVYp2gl4HTp9Ne7spJgatAlG2K8GGfRq';

module.exports = function (location, query, token, post_data, cb) {
  post_data = JSON.stringify(post_data);
  var options = {
    host: 'ingcommonapi-test.apigee.net',
    port: 80,
    path: '/commonapi/v0/nl' + location + "?" + querystring.stringify(_.extend({'apikey': apikey}, query)),
    method: 'POST',
    headers: {'Authorization': token, 'Content-Type': 'application/json',
      'Content-Length': post_data.length}
  };

  var post_req = http.request(options, function (res) {
    var data = '';
    console.log(res.statusCode);
    res.setEncoding('utf8');
    res.on('data', function (chunk) {
      data += chunk;
      console.log(chunk);
    });
    res.on('end', function () {
      cb(data);
    });
  });

  post_req.write(post_data);
  post_req.end();
};