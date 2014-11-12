define [
  'object/Element'
], (Element) ->
  class Login extends Element
    constructor: (@state) ->
      super document.createElement "iframe"
      @attr "id", "login"
      path = window.location.pathname;
      url = window.location.origin + path.substring(0, path.lastIndexOf('/'));
      @attr "src", "https://commonapi.paymentslab.nl/authserver/oauth2/authorization?client_id=HomebankApp&redirect_uri=" + url + "/authorize.html&response_type=token&grant_type=implicit"

      @on "load", () =>
        hash = @[0].contentWindow.location.hash
        token = hash.replace("#access_token=", 0).split("&")[0];
        $.cookie("token", token);
        if(token.length > 0)
          @hide()