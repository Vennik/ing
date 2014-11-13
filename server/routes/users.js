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
    res.setEncoding('utf8');
    res.on('data', function (chunk) {
      data += chunk;
    });
    res.on('end', function () {
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
    cb(result[0].token);
  });
};


router.post('/products/own', function (req, rest) {
  eigenBanken(req, function (chunk) {
    rest.send(chunk);
  });
});

router.post('/transaction/del', function (req, rest) {
  connection.query('DELETE FROM `verzoeken` WHERE ?', {'tid': req.param('tid')}, function (err, res) {
    rest.send(err == null);
  });
});

router.post('transaction/vraag', function (req, rest){
  var id = req.cookies['user'];
  connection.query('SELECT * FROM `verzoeken` WHERE ?', {'naar': id}, function(err, res){
    rest.send(res);
  });
});

var eigenBanken = function (req, rest) {
  var id = req.cookies['user'];
  var token = req.cookies['token'];
  elkeBank(id, token, rest);
};

var elkeBank = function (id, token, cb) {
  apiCall('/persons/' + id + '/products', {'apikey': consumerKey}, token, cb);
};

router.post('/products/all', function (req, rest) {
  var id = req.cookies['user'];
  var token = req.cookies['token'];

  if (!id || !token) {
    rest.status(401);
    rest.end();
    return
  }

  var sql = connection.query('SELECT `target`, `token` FROM `access` JOIN `tokens` ON access.target=tokens.id WHERE `type`="ouder" AND ?', {'access.id': id}, function (err, others) {
    eigenBanken(req, function (chunk) {
      var response = {'self': chunk, 'fullAccess': []};
      addFulls(others, response, rest);
    })
  })
});

router.post('/products/allOpen', function (req, rest) {
  var id = req.cookies['user'];
  var token = req.cookies['token'];
  var sql = connection.query('SELECT `target`, `token` FROM `access` JOIN `tokens` ON access.target=tokens.id WHERE (`type`="ouder" OR `type`="kind") AND ?', {'access.id': id}, function (err, others) {
    var response = {'fullAccess': []};
    addFulls(others, response, rest);
  });
});

var addFulls = function (others, response, rest) {
  if (others.length == 0) {
    rest.send(JSON.stringify(response))
  }
  else {
    var item = others.shift();
    elkeBank(item.target, item.token, function (chunk) {
      response.fullAccess.push({ person: item.target, products: chunk});
      addFulls(others, response, rest);
    })
  }
};

// TODO: everyone can do this
router.post('/transactions', function (req, rest) {
  var id = req.param('userId');
  //var tok = req.cookies['token'];
  var bank = req.param('bankId');

  console.log(id);

  console.log(bank);

  token(id, function (tok) {
    apiCall('/persons/' + id + '/transactions', {'apikey': consumerKey, 'customerProductId': bank}, tok, function (data) {
      rest.send(data);
    });
  });
});

router.post('/transaction/request', function (req, rest) {
  var van = req.param('van');
  console.log(van);
  var naar = req.param('naar');
  var vaniban = req.param('vaniban');
  var naariban = req.param('naariban');
  var bedrag = req.param('bedrag');
  var note = req.param('notitie');
  var sql = connection.query('INSERT INTO `verzoeken` (van, naar, vanIban, naarIban, bedrag, notitie) VALUES (?,?,?,?,?,?);', [van, naar, vaniban, naariban, bedrag, note], function (err, others) {
    connection.query('SELECT max(tid) AS "max" FROM `verzoeken`', function (err, others) {
      console.log(others);
      rest.send(JSON.stringify({'tid': others[0].max}));
      console.log(err);
    })
  });
});

router.post('/products/:id', function (req, res) {
  var token = req.cookies['token'];
  var user = req.cookies['user'];

  var iban = req.param('id');

  apiCall('/products/' + iban, {'apikey': consumerKey}, token, function(data) {
    res.send(data);
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
    console.log(token);
    connection.query('DELETE FROM `tokens` WHERE ?', {'id': body.userId}, function (err, result) {
      connection.query('INSERT INTO `tokens` VALUES (?,?) ', [body.userId, token],
        function (err, result) {
          console.log(err);
          rest(body.userId);
        });
    });
  });
};

module.exports = router;
