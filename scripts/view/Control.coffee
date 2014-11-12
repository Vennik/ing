define [
  'object/Div'
  'object/Image'
  'object/Element'
  'object/ButtonGroup'
  'object/HomeButton'
], (Div, Image, Element, ButtonGroup, HomeButton) ->
  class Control extends Div
    constructor: (@view) ->
      super()
      @attr "id", "control"
      @addClass "well well-lg"

      @append new Image "images/ing.png"

      buttonGroup = new ButtonGroup()
      buttonGroup.append new HomeButton @view
      @append buttonGroup