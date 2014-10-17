define [
  'object/Stage',
  'object/AddButton'
], (Stage, AddButton) ->

  stage = new Stage()

  stage.append new AddButton stage, "+"