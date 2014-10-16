define ['object/Circle'], (Circle) ->
  class GreenCircle extends Circle
    constructor: (x, y, radius) ->
      super x, y, radius
      @addClass "green"
