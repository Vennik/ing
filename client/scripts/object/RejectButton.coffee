define [
  'object/Button'
], (Button) ->
  class RejectButton extends Button
    constructor: (@view, @transactionID) ->
      super '<span class="glyphicon glyphicon-remove"></span>'
      @addClass "btn-danger"

      @click () =>
        @view.visual.addClass "loading"
        $.ajax "/users/transaction/del",
          data: {tid: @transactionID}
        .done (data) =>
          if data
            @parent().parent().remove()
        .always () =>
          @view.visual.removeClass "loading"