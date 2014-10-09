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

var updateObjects = [];

var red = new Circle(350, 350, 100, 0XBE1B1B);
stage.addChild(red.getCircle());
updateObjects.push(red);

var green = new Circle(700, 700, 100, 0X299C23);
stage.addChild(green.getCircle());
updateObjects.push(green);

/**********************************************************************************************************************/
/* Animate                                                                                                            */
/**********************************************************************************************************************/

requestAnimFrame(animate);

function animate() {
    // update object properties
    updateObjects.forEach(function(el) {
        el.update();
    });
    // render the stage
    renderer.render(stage);
}