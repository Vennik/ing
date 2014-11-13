define [
  'object/A',
  'object/Element'
  'view/View'
], (A, Element, View) ->
  class Circle extends A
    constructor: (@name, @id, @account, @view) ->
      super()

      @addClass "circle"

      @append new Element "<span class='name'>#{@name}<br /><span class='account'>#{@account}</span></span>"

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
