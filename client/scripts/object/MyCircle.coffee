define [
  'object/Circle'
], (Circle) ->
  class MyCircle extends Circle
    constructor: ->
      super(arguments...)
      @addClass 'me'

      @off 'click'
      @on 'click', () =>
        @parent().find("> .active").removeClass "active"
        @addClass "active"
        @view.toggleTransactions @id, @name
