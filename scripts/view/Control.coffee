define [
  'object/Div'
  'object/Image'
  'object/Element'
  'object/ButtonGroup'
  'object/AddButton'
  'object/ClearButton'
  'object/TransactionButton'
], (Div, Image, Element, ButtonGroup, AddButton, ClearButton, TransactionButton) ->
  class Control extends Div
    constructor: (@visual) ->
      super()
      @attr "id", "control"
      @addClass "well well-lg"

      @append new Image "images/ing.png"

      buttonGroup = new ButtonGroup()
      buttonGroup.append new AddButton @visual
      buttonGroup.append new ClearButton @visual
      @append buttonGroup
      @append new TransactionButton