define [
  'object/Div'
  'object/Circle'
], (Div, Circle) ->
  class Visual extends Div
    constructor: () ->
      super()
      @attr "id", "visual"

      @circles = []

      circle = new Circle "René Vennik", "8414495"
      @circles.push circle
      @append circle

      circle = new Circle "René Vennik", "8414495"
      @circles.push circle
      @append circle

      circle = new Circle "René Vennik", "8414495"
      @circles.push circle
      @append circle

      circle = new Circle "Test gebruiker", "8414495"
      @circles.push circle
      @append circle

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