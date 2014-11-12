var express = require('express');
var router = express.Router();
var http = require('http');
var fs = require('fs');
var querystring = require('querystring');
var consumerKey = 'tVYp2gl4HTp9Ne7spJgatAlG2K8GGfRq';

var mysql = require('mysql');
var connection = mysql.createConnection({
  host: 'localhost',
  user: 'ing',
  password: 'hack',
  database: 'ing'
});

connection.connect(function (err) {
  // connected! (unless `err` is set)
  console.log(err);
});

/* GET users listing. */
router.get('/', function (req, res) {
  res.send('respond with a resource');
});

router.get('/usr', function (req, res) {
  var query = connection.query('SELECT * FROM tokens', function (err, result) {
    console.log(err);
    console.log(result);
  });
});

token = function (id, cb) {
  connection.query('SELECT `token` FROM tokens WHERE ?', {id: id}, function (err, result) {
    console.log(result[0].token);
    cb(result[0].token);
  });
};


router.post('/banks/:id', function (req, rest){
  eigenBanken(req,rest);
});

var eigenBanken = function (req, rest) {
  var id = req.param('userId');
  var token = req.param('token');
  var options = {
    host: 'ingcommonapi-test.apigee.net',
    port: 80,
    path: '/commonapi/v0/nl/persons/' + id + "/products?apikey=" + consumerKey,
    method: 'GET',
    headers: {'Authorization': token}
  };
  var request = http.request(options, function (res) {
    res.setEncoding('utf8');
    res.on('data', function (chunk) {
      rest.send(chunk);
    });
  });
  request.end();
};

router.get('/banks/:id/all', function (req, rest) {
  var id = req.param('userid');
  var token = req.param('token');
  var options = {
    host: 'ingcommonapi-test.apigee.net',
    port: 80,
    path: '/commonapi/v0/nl/persons/' + id + "/products?apikey=" + consumerKey,
    method: 'GET',
    headers: {'Authorization': token}
  };
  var request = http.request(options, function (res) {
    res.setEncoding('utf8');
    res.on('data', function (chunk) {
      rest.send(chunk);
    });
  });
  request.end();
});



router.post('/login', function (req, res) {
  var token = req.param('token');
  console.log(token);
  login(token, function (id) {
    if (id >= 0) {
      res.send(JSON.stringify({'status': 'ok', 'userid': id}));
    } else {
      res.send(JSON.stringify({'status': 'nok'}));
    }
  });
});

router.get('/newToken', function (req, res) {
  var uid = req.data
});

router.get('/create/:id', function (req, res) {
  console.log(req.param('id'));
});

router.post('/create/:id', function (req, res) {
  var query = connection.query('INSERT INTO `tokens` SET ? ', {id: req.param('id'), token: req.body.token}, function (err, result) {
    console.log(err);
    res.send();
  })
});


var login = function (token, rest) {
  var options = {
    host: 'ingcommonapi-test.apigee.net',
    port: 80,
    path: '/commonapi/v0/nl/me/' + "?apikey=" + consumerKey,
    method: 'GET',
    headers: {'Authorization': token}
  };
  var req = http.request(options, function (res) {
    if (res.statusCode != 200) {
      rest(-1);
      return;
    }
    res.setEncoding('utf8');
    res.on('data', function (chunk) {
      var body = JSON.parse(chunk);
      var query = connection.query('UPDATE `tokens` SET ? WHERE ?', [
        {'token': token},
        {'id': body.userId}
      ], function (err, result) {
        rest(body.userId);
      });
    });
  });
  req.end();
};

module.exports = router;
