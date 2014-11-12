define [
  'object/A',
  'object/Element'
], (A, Element) ->
  class Circle extends A
    constructor: (@name, @account) ->
      super()

      @addClass "circle"

      nameElement = new Element "<span>#{@name}</span>";
      @html nameElement

      #@setRadius radius
      #@setPosition x, y

#      @hammer
#        preventDefault: true
#      .on "panstart", (e) =>
#        @panstart = e
#      .on "panend", (e) =>
#        @panstart = null;
#      .on "panmove", (e) =>
#        if @panstart
#          @setPosition @x + e.gesture.deltaX - @panstart.gesture.deltaX, @y + e.gesture.deltaY - @panstart.gesture.deltaY
#          @panstart = e
#      .on "pinchstart", (e) =>
#        @pinchstart = e
#      .on "pinchend", (e) =>
#        @pinchstart = null;
#      .on "pinchmove", (e) =>
#        if @pinchstart
#          radiusChange = @radius * e.gesture.scale / @pinchstart.gesture.scale - @radius
#          @setRadius @radius + radiusChange
#          @setPosition @x - radiusChange, @y - radiusChange
#          @pinchstart = e
#
#      # Enable pinch
#      @data "hammer"
#      .get "pinch"
#      .set
#          enable: true
#
#    setRadius: (radius) ->
#      @radius = radius
#      @width @radius * 2
#      @height @radius * 2
#
#    setPosition: (x, y) ->
#      @css
#        left: @x = x
#        top: @y = y
