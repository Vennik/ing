var apiCall = require('./apicall');
var connection = require('./mysql');

module.exports = function (req, yes, no) {
  var token = req.cookies['token'];
  var id = req.cookies['name'];
  apiCall('/me', {}, token, function (data) {
    var body = JSON.parse(data);
    if (id == body.userId) {
      if (yes)
        yes();
    } else {
      if (no)
        no();
    }
  })
}