define [
  'object/Element'
  'object/TransactionList'
  'object/RequestList'
  'object/Title'
  'object/Div'
  'view/Visual'
  'view/Control'
  'view/Login'
], (Element, TransactionList, RequestList, Title, Div, Visual, Control, Login) ->
  class View extends Element
    constructor: (@state) ->
      super "body"

      if !$.cookie("token")
        @append new Login @
      else
        @setState "main"

    setState: (state) ->
      @prevstate = @state;
      @state = state

      if @prevstate == "login"
        @visual = new Visual
        @append @visual
        @append new Control @

      if @state == "account"
        @visual.circlesToLeft()

        @visual
        .find ".listcontainer"
        .remove()

        container = new Div
        container.addClass "listcontainer"
        container.append new Title('Requests')
        container.append new RequestList
        container.append new Title('Transactions')
        container.append new TransactionList
        @visual.append container
      if state == "main"
        path = window.location.pathname;
        url = window.location.origin + path.substring(0, path.lastIndexOf('/'));

        $.ajax()

        @visual.circlesToMain()
        @visual
        .find ".listcontainer"
        .remove()