define [
  'object/Button'
], (Button) ->
  class ClearButton extends Button
    constructor: (@visual) ->
      super '<span class="glyphicon glyphicon-remove"></span>'

      @click () =>
        @visual.empty()