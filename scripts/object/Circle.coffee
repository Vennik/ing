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