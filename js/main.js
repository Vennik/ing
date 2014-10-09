/**
 * Created by René on 8-10-2014.
 */

/**********************************************************************************************************************/
/* Init                                                                                                              */
/**********************************************************************************************************************/

// create an new instance of a pixi stage
var stage = new PIXI.Stage(0xFFFFFF);

// create a renderer instance.
var renderer = PIXI.autoDetectRenderer(window.innerWidth, window.innerHeight, null, false, true);

window.onresize = function () {
    renderer.resize(window.innerWidth, window.innerHeight);
};

// add the renderer view element to the DOM
document.body.appendChild(renderer.view);

/**********************************************************************************************************************/
/* Circle                                                                                                             */
/**********************************************************************************************************************/

var red = new Circle(350, 350, 100, 0XFF0000);
stage.addChild(red.getCircle());

var green = new Circle(700, 700, 100, 0X00FF00);
stage.addChild(green.getCircle());

/**********************************************************************************************************************/
/* Animate                                                                                                            */
/**********************************************************************************************************************/

requestAnimFrame(animate);

function animate() {

    // render the stage
    renderer.render(stage);

}