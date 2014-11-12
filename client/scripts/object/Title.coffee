define [
  'object/Element'
], (Element) ->
  class Div extends Element
    constructor: (label)->
      super document.createElement "h2"
      @html "#{label}"
