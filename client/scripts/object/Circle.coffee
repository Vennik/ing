define [
  'object/A',
  'object/Element'
  'view/View'
], (A, Element, View) ->
  class Circle extends A
    constructor: (@name, @account, @view) ->
      super()

      @addClass "circle"

      @append new Element "<span class='name'>#{@name}<br /><span class='account'>#{@account}</span></span>"

      path = window.location.pathname;
      url = window.location.origin + path.substring(0, path.lastIndexOf('/'));

      @click () =>
        @view.visual.addClass "loading"
        $.ajax "/users/transactions",
          data:
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
