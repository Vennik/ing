define [
  'object/Element'
], (Element) ->
  class Ul extends Element
    constructor: ->
      super document.createElement "ul"