define [
  'event'
  'object/EventQueue'
], (event, EventQueue) ->
  class Circle extends PIXI.Graphics
    constructor: (x, y, @radius, color) ->
      super()
      @color = color
      @draw()

      @interactive = true

      @position =
        x: x
        y: y

      @mousedown = @touchstart = (data) =>
        data.originalEvent.preventDefault()
        @start = data.getLocalPosition this

      @mouseup = @mouseupoutside = @touchend = @touchendoutside = (data) =>
        data.originalEvent.preventDefault()
        @start = null

      @mousemove = @touchmove = (data) =>
        data.originalEvent.preventDefault()
        if @start
          end = data.getLocalPosition @parent
          @position =
            x: end.x - @start.x
            y: end.y - @start.y

          event.render()

      window.addEventListener "mousewheel", (evt) =>
        if @start
          delta = 50
          evt.preventDefault()
          if evt.ctrlKey
            delta = 100

          if 300 > @radius + evt.wheelDelta/delta > 20
            @radius += evt.wheelDelta/delta
          @draw()
          event.render()

    draw: ->
      @clear()
      @beginFill(@color)
      @drawCircle(0, 0, @radius)
      @endFill()

      @hitArea = new PIXI.Circle(0, 0, @radius)
