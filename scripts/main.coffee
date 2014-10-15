define [
  'object/RedCircle',
  'object/GreenCircle'
], (RedCircle, GreenCircle) ->

  stage = $ "#main"

  #/**********************************************************************************************************************/
  #/* Circle                                                                                                             */
  #/**********************************************************************************************************************/

  red = new RedCircle 350, 350, 100
  stage.append red.circle

  green = new GreenCircle 500, 500, 100
  stage.append green.circle