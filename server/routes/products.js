var express = require('express');
var router = express.Router();

var apiCall = require('../control/apicall');

var connection = require('../control/mysql');

router.post('/own', function (req, rest) {
  eigenBanken(req, function (chunk) {
    rest.send(chunk);
  });
});

var eigenBanken = function (req, rest) {
  var id = req.cookies['user'];
  var token = req.cookies['token'];
  elkeBank(id, token, rest);
};

var elkeBank = function (id, token, cb) {
  console.log(id);
  apiCall('/persons/' + id + '/products', {}, token, cb);
};

router.post('/all', function (req, rest) {
  var id = req.cookies['user'];
  var token = req.cookies['token'];

  if (!id || !token) {
    rest.status(401);
    rest.end();
    return
  }

  connection.query('SELECT `target`, `token` FROM `access` JOIN `tokens` ON access.target=tokens.id WHERE `type`="ouder" AND ?', {'access.id': id}, function (err, others) {
    eigenBanken(req, function (chunk) {
      var response = {'self': chunk, 'fullAccess': []};
      addFulls(others, response, rest);
    });
  });
});

router.post('/allOpen', function (req, rest) {
  var id = req.cookies['user'];
  var token = req.cookies['token'];
  connection.query('SELECT `target`, `token` FROM `access` JOIN `tokens` ON access.target=tokens.id WHERE (`type`="ouder" OR `type`="kind") AND ?', {'access.id': id}, function (err, others) {
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

router.post('/products/:id', function (req, res) {
  var token = req.cookies['token'];
  var user = req.cookies['user'];

  var iban = req.param('id');

  apiCall('/products/' + iban, {}, token, function(data) {
    res.send(data);
  });
});

module.exports = router;