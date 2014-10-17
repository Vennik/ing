define [
  'object/Element'
], (Element) ->
  class Image extends Element
    constructor: (src) ->
      super document.createElement "img"
      @attr "src", src