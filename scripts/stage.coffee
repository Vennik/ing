define [
  'Element'
], (Element) ->
  class Stage extends Element
    constructor: (@id) ->
      super('body')
      @objects = []

      @hammer()
      .on "pan", (e) ->
        e.preventDefault()

    append: (object) ->
      super(object)
      @objects.push object
