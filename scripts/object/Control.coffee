define [
  'object/Div'
  'object/ButtonGroup'
  'object/AddButton'
  'object/ClearButton'
], (Div, ButtonGroup, AddButton, ClearButton) ->
  class Control extends Div
    constructor: (@visual) ->
      super()
      @attr "id", "control"

      buttonGroup = new ButtonGroup()
      buttonGroup.append new AddButton @visual, "+"
      buttonGroup.append new ClearButton @visual, "Clear"

      @append buttonGroup