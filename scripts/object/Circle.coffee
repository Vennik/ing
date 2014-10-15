define [
  'object/Div'
], (Div) ->

  class Circle extends Div
    constructor: (@x, @y, @radius) ->
      super()

      @addClass "circle"
      @width @radius * 2
      @height @radius * 2
      @setPosition @x, @y

      @hammer()
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
          @start = e

    setPosition: (x, y) ->
      @css
        left: @x = x
        top: @y = y
