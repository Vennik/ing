define [
  'Stage',
  'object/RedCircle',
  'object/GreenCircle'
], (Stage, RedCircle, GreenCircle) ->

  stage = new Stage()

  stage.append new RedCircle 350, 350, 100
  stage.append new GreenCircle 500, 500, 100