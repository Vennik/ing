define [
  'object/Element'
], (Element) ->
  class Login extends Element
    constructor: (@view) ->
      super document.createElement "iframe"

      path = window.location.pathname;
      @url = window.location.origin + path.substring(0, path.lastIndexOf('/'));

      @mainsrc = "https://commonapi.paymentslab.nl/authserver/oauth2/authorization?client_id=HomebankApp&redirect_uri=" + @url + "&response_type=token&grant_type=implicit"
      @reset()

      @attr "id", "login"

      @on "load", () =>
        hash = @[0].contentWindow.location.hash
        hash = hash.substr(1).split("&");
        result = [];
        for item in hash
          temp = item.split("=");
          result[temp[0]] = temp[1];

        token = result['token_type'] + ' ' + result['access_token']

        if(result['token_type'] && result['access_token'])

          $.ajax @url + "/users/login",
            dataType: "json"
            type: "POST"
            data:
              'token': token
          .done (data) =>
            console.log data
            if !data.userid
              @reset()
            else
              $.cookie "user", data.userid
              $.cookie "token", token
              @view.setState "main"
              @hide()

        else
          reset()

    reset: () ->
      @attr "src", @mainsrc
