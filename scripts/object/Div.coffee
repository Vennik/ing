define [
  'Element'
], (Element) ->
  class Div extends Element
    constructor: ->
      super("<div>")