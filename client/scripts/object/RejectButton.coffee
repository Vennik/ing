define [
  'object/Button'
], (Button) ->
  class RejectButton extends Button
    constructor: (@view, @transactionID) ->
      super '<span class="glyphicon glyphicon-remove"></span>'
      @addClass "btn-danger"

      @click () =>
        if confirm "Are you sure you want to decline to this request?"
          @view.visual.addClass "loading"
          $.ajax "/users/transaction/del",
            data: {tid: @transactionID}
          .done (data) =>
            if data
              @parent().parent()
              .slideUp 200, () ->
                $ @
                .remove()
          .always () =>
            @view.visual.removeClass "loading"