define [], () ->
  class Circle
    constructor: (@x, @y, @radius) ->
      @circle = $ document.createElement "div"
      @circle.attr "class", "circle"
      @circle.width @radius * 2
      @circle.height @radius * 2
      @circle.css
        left: @x
        top: @y
