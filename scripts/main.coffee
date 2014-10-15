define [
  'object/RedCircle',
  'object/GreenCircle'
], (RedCircle, GreenCircle) ->

  stage = document.getElementById "main"

  #/**********************************************************************************************************************/
  #/* Circle                                                                                                             */
  #/**********************************************************************************************************************/

  red = new RedCircle 350, 350, 100
  stage.appendChild red.circle

  green = new GreenCircle 500, 500, 100
  stage.appendChild green.circle