define [
  'object/Element'
  'view/Visual'
  'view/Control'
], (Element, Visual, Control) ->
  class View extends Element
    constructor: ->
      super "body"

      visual = new Visual
      @append visual
      @append new Control visual