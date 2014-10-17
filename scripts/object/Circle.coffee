define [
  'object/Div'
], (Div) ->
  class Circle extends Div
    constructor: (x, y, radius) ->
      super()

      @addClass "circle"
      @setRadius radius
      @setPosition x, y

      @hammer
        preventDefault: true
      .on "panstart", (e) =>
        @panstart = e
      .on "panend", (e) =>
        @panstart = null;
      .on "panmove", (e) =>
        if @panstart
          @setPosition @x + e.gesture.deltaX - @panstart.gesture.deltaX, @y + e.gesture.deltaY - @panstart.gesture.deltaY
          @panstart = e
      .on "pinchstart", (e) =>
        @pinchstart = e
      .on "pinchend", (e) =>
        @pinchstart = null;
      .on "pinchmove", (e) =>
        if @pinchstart
          radiusChange = @radius * e.gesture.scale / @pinchstart.gesture.scale - @radius
          @setRadius @radius + radiusChange
          @setPosition @x - radiusChange / 2, @y - radiusChange / 2
          @pinchstart = e

      # Enable pinch
      @data "hammer"
      .get "pinch"
      .set
          enable: true

    setRadius: (radius) ->
      @radius = radius
      @width @radius * 2
      @height @radius * 2

    setPosition: (x, y) ->
      @css
        left: @x = x
        top: @y = y
