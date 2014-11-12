define [
  'object/Button'
  'object/Circle'
], (Button, Circle) ->
  class Div extends Button
    constructor: (@visual) ->
      super '<span class="glyphicon glyphicon-plus"></span>'

      @click () =>