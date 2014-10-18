define [
  'object/Div'
  'object/Image'
  'object/Element'
  'object/ButtonGroup'
  'object/AddButton'
  'object/ClearButton'
], (Div, Image, Element, ButtonGroup, AddButton, ClearButton) ->
  class Control extends Div
    constructor: (@visual) ->
      super()
      @attr "id", "control"
      @addClass "well"

      @append new Image "images/ing.png"

      buttonGroup = new ButtonGroup()
      buttonGroup.append new AddButton @visual
      buttonGroup.append new ClearButton @visual
      @append buttonGroup