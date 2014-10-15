define ['object/Circle'], (Circle) ->
  class GreenCircle extends Circle
    constructor: (@x, @y, @radius) ->
      super @x, @y, @radius
      @circle.className = @circle.className + " green"