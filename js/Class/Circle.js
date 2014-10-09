/**
 * Created by René on 9-10-2014.
 */

Circle = function (x, y, radius, color) {
    this.radius = radius;

    this.circle = new PIXI.Graphics();
    this.circle.beginFill(color);
    this.circle.drawCircle(0, 0, this.radius);
    this.circle.endFill();

    this.circle.setInteractive(true);
    this.circle.hitArea = new PIXI.Circle(0, 0, this.radius);

    this.circle.position = {x: x, y: y};

    this.circle.touchstart = function (data) {
        this.start = data.getLocalPosition(this);
    };

    this.circle.touchend = this.circle.touchendoutside = function (data) {
        this.start = null;
    };

    this.circle.touchmove = function (data) {
        if (this.start) {
            var end = data.getLocalPosition(this.parent);
            this.newPosition = {
                x: end.x - this.start.x,
                y: end.y - this.start.y
            };
            requestAnimFrame(animate);
        }
    };

};

Circle.prototype.update = function () {
    if (this.circle.newPosition) {
        this.circle.position = this.circle.newPosition;
    }
};

Circle.prototype.getCircle = function () {
    return this.circle;
};