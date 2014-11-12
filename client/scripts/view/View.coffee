define [
  'object/Element'
  'object/TransactionList'
  'object/RequestList'
  'view/Visual'
  'view/Control'
  'view/Login'
], (Element, TransactionList, RequestList, Visual, Control, Login) ->
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
        .find "#transaction-list"
        .remove()
        @visual
        .find "#request-list"
        .remove()
        @visual.append new RequestList
        @visual.append new TransactionList
      if @state == "main"

        path = window.location.pathname;
        url = window.location.origin + path.substring(0, path.lastIndexOf('/'));

        $.ajax()

        @visual.circlesToMain()
        @visual
        .find "#transaction-list"
        .remove()
        @visual
        .find "#request-list"
        .remove()