define [
  'event'
  'EventQueue'
], (event, EventQueue) ->
  class Circle extends PIXI.Graphics
    constructor: (x, y, @radius, color) ->
      super()
      @beginFill(color);
      @drawCircle(0, 0, @radius)
      @endFill()

      @interactive = true
      @hitArea = new PIXI.Circle(0, 0, @radius)
      @position =
        x: x
        y:

      @eventqueue = new EventQueue()

      @mousedown = @touchstart = =>
        @eventqueue.insert(@start, this, data)

      @mouseup = @mouseupoutside = @touchend = @touchendoutside = (data) ->
        data.originalEvent.preventDefault()
        @start = null

      @mousemove = @touchmove = (data) ->
        data.originalEvent.preventDefault()
        if @start
          end = data.getLocalPosition @parent
          @position =
            x: end.x - @start.x
            y: end.y - @start.y

          event.render()

    end: (data) ->
      data.originalEvent.preventDefault()
      @start = null

    start: (data) ->
      data.originalEvent.preventDefault()
      @start = data.getLocalPosition this

    move: (data) ->
      data.originalEvent.preventDefault()
      if @start
        end = data.getLocalPosition @parent
        @position =
          x: end.x - @start.x
          y: end.y - @start.y

        event.render()