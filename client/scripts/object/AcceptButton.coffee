define [
  'object/Button'
  'view/AcceptTransaction'
], (Button, AcceptTransaction) ->
  class AcceptButton extends Button
    constructor: (@view) ->
      super '<span class="glyphicon glyphicon-ok"></span>'
      @addClass "btn-success"

      @click () =>
        @view.visual
        .addClass "transaction-pending"
        .append new AcceptTransaction