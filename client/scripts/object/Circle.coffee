define [
  'object/A',
  'object/Element'
  'view/View'
], (A, Element, View) ->
  class Circle extends A
    constructor: (@name, @id, @account, @balance, @view) ->
      super()

      @addClass "circle"
      if account[0] == 'T'
        @addClass "blue"

      @append new Element "<span class='name'>#{@name}<br /><span class='account'>#{@account}</span></span>"

      @balance = parseFloat(@balance).toFixed(2);

      @attr "title", "€ " + @balance
      @attr "data-toggle", "tooltip"
      @attr "data-placement", "bottom"
      @tooltip()

      path = window.location.pathname;
      url = window.location.origin + path.substring(0, path.lastIndexOf('/'));


      @click () =>
        @parent().find("> .active").removeClass "active"
        @addClass "active"
        @view.visual.addClass "loading"
        $.ajax "/users/transactions",
          data:
            'userId': @id
            'bankId': @account
        .done (data) =>
          @view.toggleTransactions(data.list)
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
