var express = require('express');
var router = express.Router();

var apiCall = require('../control/apicall');
var checkLogin = require('../control/checklogin');

var connection = require('../control/mysql');

connection.connect(function (err) {
  // connected! (unless `err` is set)
  console.log(err);
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




// TODO: everyone can do this
router.post('/transactions', function (req, rest) {
  var id = req.param('userId');
  //var tok = req.cookies['token'];
  var iban = req.param('iban');

  token(id, function (tok) {
    apiCall('/persons/' + id + '/transactions', {'customerProductId': iban}, tok, function (data) {
      rest.send(data);
    });
  });
});

router.post('/transactions/:id', function (req, res) {
  var clientId = req.param('id');
  var id = req.cookies['user'];
  if (clientId != id) {
    checkLogin(req, res, 5, function () {
      connection.query('SELECT token FROM tokens INNER JOIN access ON access.id=tokens.id WHERE access.type<5 AND ?', {'tokens.id': clientId}, function (err, result) {
        if (!err && result.length) {
          var token = result[0].token;
          apiCall('/persons/' + clientId + '/transactions', {}, token, function (data) {
            res.send(data);
            res.end();
          });
        } else { // other one is also a parent.
          res.status(403);
          res.send(JSON.stringify({'status': 'nok'}));
          res.end();
        }
      });
    }, function() {
      res.status(403);
      res.send(JSON.stringify({'status': 'nok'}));
      res.end();
    });
  } else {
    var token = req.cookies['token'];
    apiCall('/persons/' + id + '/transactions', {}, token, function (data) {
      res.send(data);
      res.end();
    });
  }
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

var login = function (token, rest) {
  console.log(token);
  apiCall('/me', {}, token, function (data) {
    var body = JSON.parse(data);

    connection.query('DELETE FROM `tokens` WHERE ?', {'id': body.userId}, function (err, result) {
      connection.query('INSERT INTO `tokens` VALUES (?,?) ', [body.userId, token],
        function (err, result) {
          console.log(err);
          rest(body.userId);
        });
    });
  });
};


router.post('/create/:id', function (req, res) {
  var query = connection.query('INSERT INTO `tokens` SET ? ', {id: req.param('id'), token: req.body.token}, function (err, result) {
    console.log(err);
    res.send();
  })
});

module.exports = router;
