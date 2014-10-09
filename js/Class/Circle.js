/**
 * Created by René on 9-10-2014.
 */

Circle = function(x, y, radius) {

    this.pos = {x: x, y: y};
    this.radius = radius;

    this.circle = new PIXI.Graphics();
    this.circle.beginFill(0XFF0000);
    this.circle.drawCircle(this.pos.x, this.pos.y, this.radius);
    this.circle.endFill();

    this.circle.setInteractive(true);
    this.circle.hitArea = new PIXI.Circle(this.pos.x, this.pos.y, this.radius);

};

Circle.prototype.getCircle = function() {

    return this.circle;

}