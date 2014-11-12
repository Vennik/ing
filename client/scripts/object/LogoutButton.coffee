define [
  'object/Button'
], (Button) ->
  class LogoutButton extends Button
    constructor: (@view) ->
      super '<span class="glyphicon glyphicon-log-out"></span>'

      @click () =>
        $.removeCookie 'token'
        @view.setState "login"