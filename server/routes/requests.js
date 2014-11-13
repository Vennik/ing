var express = require('express');
var router = express.Router();

var checkLogin = require('../control/checklogin');

var connection = require('../control/mysql');

router.post('/create', function (req, res) {
  checkLogin(req, function() {
    var van = req.param('van');
    var naar = req.param('naar');
    var vaniban = req.param('vaniban');
    var naariban = req.param('naariban');
    var bedrag = req.param('bedrag');
    var note = req.param('notitie');
    var sql = connection.query('INSERT INTO `verzoeken` (van, naar, vanIban, naarIban, bedrag, notitie) VALUES (?,?,?,?,?,?);', [van, naar, vaniban, naariban, bedrag, note], function (err, result) {
      res.send(JSON.stringify({'status': 'ok', 'tid': result.insertId}));
    });
  }, function() {
    res.send(JSON.stringify({'status': 'nok'}));
  })
});

router.post('/delete', function (req, res) {
  checkLogin(req, function() {
    connection.query('DELETE FROM `verzoeken` WHERE ?', {'tid': req.param('tid')}, function (err, result) {
      res.send(JSON.stringify(err == null));
    });
  })
});

router.post('/all', function (req, res){
  checkLogin(req, function() {
    var id = req.cookies['user'];
    connection.query('SELECT * FROM `verzoeken` WHERE ?', {'naar': id}, function(err, result){
      console.log(result);
      res.send(result);
    });
  });
});

module.exports = router;