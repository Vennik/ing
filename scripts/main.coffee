define [
  'object/Circle'
], (Circle) ->

  stage = new PIXI.Stage(0xFFFFFF)

  stats = new Stats()
  stats.setMode(0)

  stats.domElement.style.position = 'absolute'
  stats.domElement.style.left = '0px'
  stats.domElement.style.top = '0px'

  document.body.appendChild(stats.domElement)

  renderer = PIXI.autoDetectRenderer window.innerWidth, window.innerHeight, null, false, true

  window.onresize = () ->
    renderer.resize window.innerWidth, window.innerHeight
    requestAnimationFrame animate

  document.body.appendChild renderer.view

  #/**********************************************************************************************************************/
  #/* Circle                                                                                                             */
  #/**********************************************************************************************************************/

  red = new Circle(350, 350, 100, 0xBE1B1B);
  stage.addChild(red);

  green = new Circle(700, 700, 100, 0x299C23);
  stage.addChild(green);

  #/**********************************************************************************************************************/
  #/* Animate                                                                                                            */
  #/**********************************************************************************************************************/

  animate = () ->
    stats.begin()
    requestAnimFrame(animate)
    #render the stage
    renderer.render(stage)
    stats.end()

  requestAnimFrame(animate)