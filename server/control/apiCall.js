var http = require('http');
var _ = require('underscore');
var querystring = require('querystring');

var apikey = 'tVYp2gl4HTp9Ne7spJgatAlG2K8GGfRq';

module.exports = function (location, query, token, cb) {
  var options = {
    host: 'ingcommonapi-test.apigee.net',
    port: 80,
    path: '/commonapi/v0/nl' + location + "?" + querystring.stringify(_.extend({'apikey': apikey}, query)),
    method: 'GET',
    headers: {'Authorization': token}
  };

  http.request(options, function (res) {
    var data = '';
    res.setEncoding('utf8');
    res.on('data', function (chunk) {
      data += chunk;
    });
    res.on('end', function () {
      cb(data);
    });
  }).end();
};