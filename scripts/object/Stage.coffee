define [
  'object/Element'
], (Element) ->
  class Stage extends Element
    constructor: () ->
      super "body"

      @hammer
        preventDefault: true
      .on "pan", (e) =>