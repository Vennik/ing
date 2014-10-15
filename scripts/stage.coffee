define [], () ->
  class Stage
    constructor: (@id) ->
      @objects = [];
      @stage = $ "body"

      @initEvents()

    add: (object) ->
      @objects.push object
      @stage.append(object.element);

    initEvents: ->
      @stage
      .hammer()
      .on "pan", (e) ->
        e.preventDefault()