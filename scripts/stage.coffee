define [
  'object/Element'
], (Element) ->
  class Stage extends Element
    constructor: (@id) ->
      super('body')
      @objects = []

      @initEvents()

    add: (object) ->
      @objects.push object
      @append(object.element);

    initEvents: ->
      @hammer()
      .on "pan", (e) ->
        e.preventDefault()
