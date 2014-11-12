define [
  'object/Element'
  'object/TransactionList'
  'view/Visual'
  'view/Control'
], (Element, TransactionList, Visual, Control) ->
  class View extends Element
    constructor: (@state) ->
      super "body"

      @visual = new Visual
      @append @visual
      @append new Control @

    setState: (state) ->
      @state = state

      if state == "account"
        @visual.circlesToLeft()
        @visual.append new TransactionList
      if state == "main"
        @visual.circlesToMain()
        @visual
        .find "#transaction-list"
        .remove()