define [
  'object/Div'
  'object/Circle'
  'view/View'
], (Div, Circle, View) ->
  class Visual extends Div
    constructor: (@view) ->
      super()
      @attr "id", "visual"

      @circles = []

      @hammer
          preventDefault: true
      .on "pan", (e) =>

    circlesToLeft: ->
      for circle in @circles
        do (circle) ->
          circle.setLeft _i

    circlesToMain: ->
      for circle in @circles
        do (circle) ->
          circle.setMain _i

    update: (data) ->
      for item in @circles
        item.remove()

      @circles = []
      for item in data.list
        console.log item
        circle = new Circle item.customerDescription.split(",").reverse().join(" "), item.iban, @view
        @circles.push circle
        @append circle