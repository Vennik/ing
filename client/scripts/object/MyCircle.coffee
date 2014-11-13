define [
  'object/Circle'
], (Circle) ->
  class MyCircle extends Circle
    constructor: ->
      super(arguments...)
      @addClass 'me'

      @click () =>
        @parent().find("> .active").removeClass "active"
        @addClass "active"
        @view.visual.addClass "loading"
        $.ajax "/users/transactions",
          data:
            'userId': @id
            'iban': @account
        .done (data) =>
          @view.toggleTransactions(@id, @account, data.list)
        .always () =>
          @view.visual.removeClass "loading"