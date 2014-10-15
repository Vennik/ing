define [], () ->
  class Circle
    constructor: (@x, @y, @radius) ->
      @element = $ document.createElement "div"
      @element.addClass "circle"
      @element.width @radius * 2
      @element.height @radius * 2
      @element.css
        left: @x
        top: @y

      @initEvents()

    setPosition: (x, y) ->
      @element.css
        left: @x = x
        top: @y = y

    initEvents: ->
      # Mouse events
      @element
      .on "mousedown", (e) =>
        e.preventDefault()
        @start = e

      $(document)
      .on "mouseup", (e) =>
        @start = null
      .on "mousemove", (e) =>
        e.preventDefault()
        if @start
          @setPosition @x + e.pageX - @start.pageX, @y + e.pageY - @start.pageY
          @start = e;

      # Touch events
      hammertime = new Hammer(@element[0], {});
      hammertime.get("swipe").set({ direction: Hammer.DIRECTION_ALL });
      hammertime
      .on "swipe", (e) ->
        console.log e