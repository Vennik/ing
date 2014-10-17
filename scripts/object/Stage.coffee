define [
  'object/Element'
  'object/Visual'
  'object/Control'
], (Element, Visual, Control) ->
  class Stage extends Element
    constructor: () ->
      super "body"

      visual = new Visual
      @append visual
      @append new Control visual

      @hammer
        preventDefault: true
      .on "pan", (e) =>