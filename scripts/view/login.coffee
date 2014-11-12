define [
  'object/Element'
], (Element) ->
  class Login extends Element
    constructor: (@state) ->
      super document.createElement "iframe"
      @attr "id", "login"
      @attr "src", "https://commonapi.paymentslab.nl/authserver/oauth2/authorization?client_id=HomebankApp&redirect_uri=http://ing/authorize.html&response_type=token&grant_type=implicit"

      @on "load", () =>
        hash = @[0].contentWindow.location.hash
        token = hash.replace("#access_token=", 0).split("&")[0];
        $.cookie("token", token);
        if(token.length > 0)
          @hide()