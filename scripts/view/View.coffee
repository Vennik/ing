define [
  'object/Element'
  'object/TransactionList'
  'view/Visual'
  'view/Control'
  'view/Login'
], (Element, TransactionList, Visual, Control, Login) ->
  class View extends Element
    constructor: (@state) ->
      super "body"

      @visual = new Visual

      @append @visual
      @append new Control @
      if !$.cookie("token")
        @append new Login

    setState: (state) ->
      @state = state

      if state == "account"
        @visual.circlesToLeft()
        @visual
        .find "#transaction-list"
        .remove()
        @visual.append new TransactionList
      if state == "main"
        @visual.circlesToMain()
        @visual
        .find "#transaction-list"
        .remove()