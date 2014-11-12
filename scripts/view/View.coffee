define [
  'object/Element'
  'view/Visual'
  'view/Control'
], (Element, Visual, Control) ->
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
      if state == "main"
        @visual.circlesToMain()