define [
  'object/Circle'
  'event'
], (Circle, event) ->

  stage = new PIXI.Stage 0xFFFFFF

  renderer = PIXI.autoDetectRenderer window.innerWidth, window.innerHeight, null, false, true

  animate = () ->
    #render the stage
    renderer.render(stage)

  window.onresize = () ->
    renderer.resize window.innerWidth, window.innerHeight
    requestAnimFrame animate

  document.body.appendChild renderer.view

  #/**********************************************************************************************************************/
  #/* Circle                                                                                                             */
  #/**********************************************************************************************************************/

  red = new Circle 350, 350, 100, 0xBE1B1B
  stage.addChild red

  green = new Circle 700, 700, 100, 0x299C23
  stage.addChild green

  event.listen document, ->
    requestAnimFrame animate

  #/**********************************************************************************************************************/
  #/* Animate                                                                                                            */
  #/**********************************************************************************************************************/

  requestAnimFrame animate