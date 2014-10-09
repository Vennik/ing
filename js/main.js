/**
 * Created by René on 8-10-2014.
 */

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
/* Bunny                                                                                                              */
/**********************************************************************************************************************/

// create a texture from an image path
var texture = PIXI.Texture.fromImage("images/bunny.png");
// create a new Sprite using the texture
var bunny = new PIXI.Sprite(texture);

// center the sprites anchor point
bunny.anchor.x = 0.5;
bunny.anchor.y = 0.5;

// move the sprite t the center of the screen
bunny.position.x = 200;
bunny.position.y = 150;

stage.addChild(bunny);

/**********************************************************************************************************************/
/* Circle                                                                                                             */
/**********************************************************************************************************************/

var circle = new Circle(350, 350, 100);
stage.addChild(circle.getCircle());

/**********************************************************************************************************************/
/* Animate                                                                                                            */
/**********************************************************************************************************************/

requestAnimFrame(animate);

function animate() {

    requestAnimFrame(animate);

    // just for fun, lets rotate mr rabbit a little
    bunny.rotation += 0.1;

    // render the stage
    renderer.render(stage);

}