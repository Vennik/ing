/**
 * Created by René on 8-10-2014.
 */

// create an new instance of a pixi stage
var stage = new PIXI.Stage(0xFFFFFF);

// create a renderer instance.
var renderer = PIXI.autoDetectRenderer(window.innerWidth, window.innerHeight, null, false, true);

window.onresize = function() {
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

var circle = new PIXI.Graphics();
circle.beginFill(0XFF0000);
circle.drawCircle(300, 300, 100);
circle.endFill();
stage.addChild(circle);

var circle2 = new PIXI.Graphics();
circle2.beginFill(0X00FF00);
circle2.drawCircle(450, 340, 100);
circle2.endFill();
stage.addChild(circle2);

var circle3 = new PIXI.Graphics();
circle3.beginFill(0XFF0000);
circle3.drawCircle(300, 500, 75);
circle3.endFill();
stage.addChild(circle3);

var circle4 = new PIXI.Graphics();
circle4.beginFill(0X00FF00);
circle4.drawCircle(150, 440, 75);
circle4.endFill();
stage.addChild(circle4);

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