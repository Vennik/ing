define [
  'object/Div'
  'object/Element'
  'object/ButtonGroup'
  'object/AddButton'
  'object/ClearButton'
], (Div, Element, ButtonGroup, AddButton, ClearButton) ->
  class Control extends Div
    constructor: (@visual) ->
      super()
      @attr "id", "control"

      header = new Element document.createElement "h2"
      header.text "control"
      @append header

      buttonGroup = new ButtonGroup()
      buttonGroup.append new AddButton @visual
      buttonGroup.append new ClearButton @visual
      @append buttonGroup