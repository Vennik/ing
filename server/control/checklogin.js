var apiCall = require('./apicall');
var connection = require('./mysql');

module.exports = function (req, res, baselevel, yes, no) {
  var token = req.cookies['token'];
  var id = req.cookies['user'];
  connection.query('SELECT type FROM access WHERE ? LIMIT 1', {'id': id}, function (err, results) {
    if (parseInt(results[0].type) >= baselevel) {
      apiCall('/me', {}, token, function (data) {
        var body = JSON.parse(data);
        console.log(body.userId, id, body.userId == id);
        if (id == body.userId) {
          if (yes)
            yes();
        } else {
          if (no) {
            no();
          } else {
            res.status(403).end();
          }
        }
      });
    } else {
      if (no) {
        no();
      } else {
        res.status(403).end();
      }
    }
  });
}