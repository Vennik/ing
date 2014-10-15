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
      @element
      .hammer()
      .on "panstart", (e) =>
        e.preventDefault()
        @start = e
      .on "panend", (e) =>
        e.preventDefault()
        @start = null;
      .on "pan", (e) =>
        e.preventDefault()
        if @start
          @setPosition @x + e.gesture.deltaX - @start.gesture.deltaX, @y + e.gesture.deltaY - @start.gesture.deltaY
          @start = e;