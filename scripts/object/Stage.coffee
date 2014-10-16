define [
  'object/Element'
], (Element) ->
  class Stage extends Element
    constructor: () ->
      super "body"
      @objects = []

      @hammer
        preventDefault: true
      .on "pan", (e) =>

    append: (object) ->
      super object
      @objects.push object