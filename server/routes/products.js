var express = require('express');
var router = express.Router();

var apiCall = require('../control/apicall');
var checkLogin = require('../control/checklogin');
var connection = require('../control/mysql');

router.post('/own', function (req, res) {
  var id = req.cookies['user'];
  var token = req.cookies['token'];
  apiCall('/persons/' + id + '/transactions', {}, token, function (data) {
    res.send(data);
  });
});

var person = function (id, token, cb) {
  apiCall('/persons/' + id, {}, token, cb);
};

var addOthers = function(data, response, res) {
  if (data.length == 0) {
    res.send(JSON.stringify(response))
  }
  else {
    var item = data.shift();
    person(item.id, item.token, function (chunk) {
      var others = JSON.parse(chunk);
      others.level = item.level;
      response.others.push(others);
      addOthers(data, response, res);
    })
  }
}

router.post('/all', function (req, res) {
  var id = req.cookies['user'];
  var token = req.cookies['token'];
  connection.query('SELECT type FROM access WHERE ?', {'id': id}, function(err, level) {
    connection.query('SELECT DISTINCT t.id as id, t.token as token, a.type as level FROM tokens t INNER JOIN access a ON t.id=a.id WHERE t.id<>?', [id], function (err, result) {
      person(id, token, function(chunk) {
        console.log(result);
        var self = JSON.parse(chunk);
        self.level = level[0].type;
        var response_object = {'self': self, 'others': []};
        addOthers(result, response_object, res);
      });
    });
  })
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