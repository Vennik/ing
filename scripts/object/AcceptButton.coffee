define [
  'object/Button'
], (Button) ->
  class AcceptButton extends Button
    constructor: ->
      super '<span class="glyphicon glyphicon-ok"></span>'
      @addClass "btn-success"

      @click () =>