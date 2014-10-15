define [], () ->
  class Stage
    constructor: (@id) ->
      @objects = [];
      @stage = $ "body"

    add: (object) ->
      @objects.push object
      @stage.append(object.element);