define [
  'event'
  'object/EventQueue'
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

      window.addEventListener "scroll", (evt) =>
        console.log "scrolling"
        if @start
          if evt.direction is 1
            this.size += 1
