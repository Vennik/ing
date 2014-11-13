var express = require('express');
var router = express.Router();
var post = require('../control/apiPostCall');

var checkLogin = require('../control/checklogin');

var connection = require('../control/mysql');

router.post('/create', function (req, res) {
  checkLogin(req, res, function () {
    var van = req.param('van');
    var naar = req.param('naar');
    var vaniban = req.param('vaniban');
    var naariban = req.param('naariban');
    var bedrag = req.param('bedrag');
    var note = req.param('notitie');
    var naam = req.param('naam');
    var sql = connection.query('INSERT INTO `verzoeken` (van, naar, vanIban, naarIban, bedrag, notitie, naam) VALUES (?,?,?,?,?,?,?);', [van, naar, vaniban, naariban, bedrag, note, naam], function (err, result) {
      console.log(err);
      res.send(JSON.stringify({'status': 'ok', 'tid': result.insertId})).end();
    });
  }, function () {
    res.send(JSON.stringify({'status': 'nok'})).end();
  })
});

router.post('/server', function (req, rest) {
  var tid = req.param('tid');
  connection.query('SELECT * FROM `verzoeken` WHERE ?', {'tid': tid}, function (err, res) {
    var result = res[0];
    console.log(result);
    var object = {
      "sourceProductId": result.vanIban,
      "sourceProductIdentification": result.vanIban,
      "targetProductId": result.naarIban,
      "targetProductIdentification": result.naarIban,
      "targetCodeType": {
        "code": "SDA",
        "label": "This is an Account"
      },
      "targetCode": result.naarIban,
      "targetBICCode": result.naarIban,
      "targetCustomerName": result.naam,
      "amount": {
        "value": result.bedrag / 100,
        "currency": {
          "code": "EUR",
          "label": "unknown"
        }
      },
      "commission": {
        "value": 0,
        "currency": {
          "code": "EUR",
          "label": "unknown"
        }
      },
      "executionDate": {
        "datetime": "2014-11-11"
      },
      "transferType": {
        "code": "C2C",
        "label": ""
      },
      "description": "Un transfer",
      "paymentReference": "unknown"
    };

    post('/transfers', null, req.cookies['token'], object, function (data) {
      rest.write(data);
      rest.end();
    });

  });


});


router.post('/delete', function (req, res) {
  checkLogin(req, res, function () {
    connection.query('DELETE FROM `verzoeken` WHERE ?', {'tid': req.param('tid')}, function (err, result) {
      res.send(JSON.stringify(err == null)).end();
    });
  });
});

router.post('/all', function (req, res) {
  checkLogin(req, res, function () {
    var id = req.cookies['user'];
    connection.query('SELECT * FROM `verzoeken` WHERE ?', {'naar': id}, function (err, result) {
      res.send(JSON.stringify({'requests': result}));
      res.end();
    });
  });
});

router.get('/:id', function (req, res) {
  checkLogin(req, res, function () {
    var user = req.cookies['user'];
    var id = req.param('id');
    connection.query('SELECT * FROM `verzoeken` WHERE ? AND ? LIMIT 1', [
      {'tid': id},
      {'naar': 11701}
    ], function (err, result) {
      if (result && result.length > 0) {
        res.send(JSON.stringify(result[0])).end();
        return
      }

      res.status(404).end();
    })
  })

});

module.exports = router;