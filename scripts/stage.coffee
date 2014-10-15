define [], () ->
  class Stage
    constructor: (@id) ->
      @objects = [];
      @stage = $ document.createElement "div"
      $("body").prepend @stage

    add: (object) ->
      @objects.push object
      @stage.append(object.element);