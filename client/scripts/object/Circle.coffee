define [
  'object/A',
  'object/Element'
  'view/View'
], (A, Element, View) ->
  class Circle extends A
    constructor: (@name, @account, @view) ->
      super()

      @addClass "circle"

      @append new Element "<span class='name'>#{@name}</span>"
      @append new Element "<span class='account'>#{@account}</span>"

      path = window.location.pathname;
      url = window.location.origin + path.substring(0, path.lastIndexOf('/'));

      @click () =>
        @view.visual.addClass "loading"
        $.ajax "/users/transactions"
        .done (data) =>
          console.log(data.list)
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
