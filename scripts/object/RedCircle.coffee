define ['object/Circle'], (Circle) ->
  class RedCircle extends Circle
    constructor: (@x, @y, @radius) ->
      super @x, @y, @radius
      @addClass "red"

