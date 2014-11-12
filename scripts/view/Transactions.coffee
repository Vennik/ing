define [
  'object/Div'
  'object/Image'
], (Div, Image) ->
  class Control extends Div
    constructor: (@visual) ->
      super()
      @attr "id", "control"
      @addClass "well well-lg"

      @append new Image "images/ing.png"