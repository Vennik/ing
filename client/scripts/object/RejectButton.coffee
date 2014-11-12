define [
  '../../dist/scripts/object/Button'
], (Button) ->
  class RejectButton extends Button
    constructor: ->
      super '<span class="glyphicon glyphicon-remove"></span>'
      @addClass "btn-danger"

      @click () =>