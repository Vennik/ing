define [
  'object/Div'
  'object/Circle'
  'object/MyCircle'
  'view/View'
], (Div, Circle, MyCircle, View) ->
  class Visual extends Div
    constructor: (@view) ->
      super()
      @attr "id", "visual"

      @circles = []

    circlesToLeft: ->
      for circle in @circles
        do (circle) ->
          circle.setLeft _i

    circlesToMain: ->
      for circle in @circles
        do (circle) ->
          circle
          .setMain _i
          .removeClass "active"

    update: (data) ->
      console.log data
      for item in @circles
        item.remove()

      @circles = []

      own = data.self
      others = data.others


      circle = new MyCircle own.name.split(",").reverse().join(" "), own.id, own.level, @view
      @circles.push circle
      @append circle

      for other in others
        circle = new Circle other.name.split(",").reverse().join(" "), other.id, other.level, @view
        @circles.push circle
        @append circle
