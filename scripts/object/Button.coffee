define [
  'object/Element'
], (Element) ->
  class Div extends Element
    constructor: (value) ->
      super document.createElement "button"
      @addClass "btn btn-primary"
      @html value