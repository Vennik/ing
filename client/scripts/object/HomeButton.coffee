define [
  'object/Button'
], (Button) ->
  class HomeButton extends Button
    constructor: (@view) ->
      super '<span class="glyphicon glyphicon-home"></span>'

      @click () =>
        @view.setState "main"