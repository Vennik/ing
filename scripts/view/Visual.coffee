define [
  'object/Div'
  'object/Circle'
], (Div, Circle) ->
  class Visual extends Div
    constructor: () ->
      super()
      @attr "id", "visual"

      @append new Circle "René Vennik", "8414495"
      @append new Circle "René Vennik", "8414495"
      @append new Circle "René Vennik", "8414495"
      @append new Circle "René Vennik", "8414495"

      @hammer
          preventDefault: true
      .on "pan", (e) =>