define [
  'object/A',
  'object/Element'
  'view/View'
], (A, Element, View) ->
  class Circle extends A
    constructor: (@name, @id, @level, @view) ->
      super()

      @addClass "circle"
      if @level > 5
        @addClass "blue"
#      if account[0] == 'T'
#        @addClass "blue"

      @append new Element "<span class='name'>#{@name}</span>"

      #@balance = parseFloat(@balance).toFixed(2);

      @attr "title", "€ " + @balance
      @attr "data-toggle", "tooltip"
      @attr "data-placement", "bottom"
      @tooltip()

      @click () =>
        @parent().find("> .active").removeClass "active"
        @addClass "active"
        @view.visual.addClass "loading"
        $.ajax "/users/products/own",
          data:
            'userId': @id
            'iban': @account
        .done (data) =>
          @view.toggleTransactions(@id, @account, data.list)
        .always () =>
          @view.visual.removeClass "loading"

    setLeft: (index) ->
      @css
        top: index * 140
      @addClass "small"

    setMain: (index) ->
      @css
        top: 0
      @removeClass "small"
