define [
  'object/Stage'
  'object/ButtonGroup'
  'object/AddButton'
  'object/ClearButton'
], (Stage, ButtonGroup, AddButton, ClearButton) ->

  stage = new Stage()

  buttonGroup = new ButtonGroup()
  buttonGroup.append new AddButton stage, "+"
  buttonGroup.append new ClearButton stage, "Clear"

  stage.append buttonGroup