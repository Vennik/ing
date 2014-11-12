define [
  'object/Button'
], (Button) ->
  class RequestButton extends Button
    constructor: () ->
      super '<span class="glyphicon glyphicon-share-alt"></span>'
      @addClass "btn-primary"

      @click () =>
        @.parent().parent()
        .find ".drop"
        .toggleClass "open"