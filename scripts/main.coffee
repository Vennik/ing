define [
  'object/Stage',
  'object/Button',
  'object/RedCircle',
  'object/GreenCircle'
], (Stage, Button, RedCircle, GreenCircle) ->

  stage = new Stage()

  stage.append new Button "+"

  stage.append new RedCircle 250, 250, 100
  stage.append new GreenCircle 500, 500, 100