define [
  'object/Element'
], (Element) ->
  class ListGroup extends Element
    constructor: ->
      super document.createElement "ul"