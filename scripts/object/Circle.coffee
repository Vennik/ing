define [], () ->
  class Circle
    constructor: (@x, @y, @radius) ->
      @circle = document.createElement "div";
      @circle.className = "circle";
      @circle.style.width = (@radius * 2) + "px"
      @circle.style.height = (@radius * 2) + "px"
      @circle.style.left = @x + "px"
      @circle.style.top = @y + "px"