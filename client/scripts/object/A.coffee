define [
  'object/Element'
], (Element) ->
  class Div extends Element
    constructor: ->
      super document.createElement "a"