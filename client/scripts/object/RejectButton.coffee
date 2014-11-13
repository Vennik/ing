define [
  'object/Button'
], (Button) ->
  class RejectButton extends Button
    constructor: (@view) ->
      super '<span class="glyphicon glyphicon-remove"></span>'
      @addClass "btn-danger"

      @click () =>
        @view.visual.addClass "loading"
        $.ajax "/users/transaction/del",
          data: {tid: 123}
        .done (data) =>
          if data
            @parent().parent().remove()
        .always () =>
          @view.visual.removeClass "loading"