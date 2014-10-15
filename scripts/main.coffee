define [
  'Stage',
  'object/RedCircle',
  'object/GreenCircle'
], (Stage, RedCircle, GreenCircle) ->

  stage = new Stage

  stage.add new RedCircle 350, 350, 100
  stage.add new GreenCircle 500, 500, 100