var express = require('express');
var router = express.Router();
var http = require('http');
var querystring = require('querystring');
var consumerKey = 'tVYp2gl4HTp9Ne7spJgatAlG2K8GGfRq';

var connection = require('../control/mysql');

var apiCall = function (location, query, token, cb) {
  var options = {
    host: 'ingcommonapi-test.apigee.net',
    port: 80,
    path: '/commonapi/v0/nl' + location + "?" + querystring.stringify(query),
    method: 'GET',
    headers: {'Authorization': token}
  };

  http.request(options, function (res) {
    var data = '';
    res.setEncoding('utf8')
    res.on('data', function (chunk) {
      data += chunk;
    })
      .on('end', function () {
        cb(data);
      });
  }).end();
};

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

/**
 * Return the bearer token from id
 * @param id A person
 * @param cb Called on finish
 */
var token = function (id, cb) {
  connection.query('SELECT `token` FROM tokens WHERE ?', {id: id}, function (err, result) {
    console.log(result[0].token);
    cb(result[0].token);
  });
};


router.post('/banks/own', function (req, rest) {
  eigenBanken(req, function (chunk) {
    rest.send(chunk);
  });
});

var eigenBanken = function (req, rest) {
  var id = req.param('userId');
  var token = req.param('token');
  elkeBank(id, token, rest);
};

var elkeBank = function (id, token, cb) {
  apiCall('/persons/' + id + '/products', {'apikey': consumerKey}, token, cb);
}

router.post('/banks/all', function (req, rest) {
  var id = req.param('userId');
  var token = req.param('token');
  var sql = connection.query('SELECT `target`, `token` FROM `access` JOIN `tokens` ON access.target=tokens.id WHERE `type`="ouder" AND ?', {'access.id': id}, function (err, others) {
    eigenBanken(req, function (chunk) {
      var response = {'self': chunk, 'fullAccess': []};
      addFulls(others, response, rest);
    })
  })
});

var addFulls = function (others, response, rest) {
  if (others.length == 0) {
    rest.send(JSON.stringify(response))
  }
  else {
    var item = others.shift();
    elkeBank(item.target, item.token, function (chunk) {
      response.fullAccess.push({ person: item.target, banks: chunk});
      addFulls(others, response, rest);
    })
  }
};

router.post('/transactions', function(req, rest){
  var id =  req.param('userId');
  var bank = req.param('bankId');
  token(id, function(token){
    var options = {
      host: 'ingcommonapi-test.apigee.net',
      port: 80,
      path: '/commonapi/v0/nl/persons/' + id + "/transactions?apikey=" + consumerKey + "&customerProductId="+bank,
      method: 'GET',
      headers: {'Authorization': token}
    };
    var request = http.request(options, function (res) {
      res.setEncoding('utf8');
      var data ='';
      res.on('data', function (chunk) {
        data+=chunk;
      });
      res.on('end', function(){
        rest.send(data);
      })
    });
    request.end();
  });
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
  apiCall('/me', {'apikey': consumerKey}, token, function (data) {
    var body = JSON.parse(data);
    connection.query('UPDATE `tokens` SET ? WHERE ?', [
      {'token': token},
      {'id': body.userId}
    ], function (err, result) {
      rest(body.userId);
    });
  });
};

module.exports = router;
