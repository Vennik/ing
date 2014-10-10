/**
 * Created by René on 9-10-2014.
 */

Circle = function (x, y, radius, color) {
    var $this = this;
    this.eventQueue = new EventQueue();

    this.circle = new PIXI.Graphics();
    this.circle.beginFill(color);
    this.circle.drawCircle(0, 0, radius);
    this.circle.endFill();

    this.circle.interactive = true;
    this.circle.hitArea = new PIXI.Circle(0, 0, radius);

    this.circle.position = {x: x, y: y};

    this.circle.mousedown = this.circle.touchstart = function (data) {
        $this.eventQueue.insert(Circle.prototype.touchStart, $this, [data]);
    };

    this.circle.mouseup = this.circle.mouseupoutside = this.circle.touchend = this.circle.touchendoutside = function (data) {
        $this.eventQueue.insert(Circle.prototype.touchEnd, $this, [data]);
    };

    this.circle.mousemove = this.circle.touchmove = function (data) {
        $this.eventQueue.insert(Circle.prototype.touchMove, $this, [data]);
    };

};

Circle.prototype.update = function () {
    while (this.eventQueue.hasEvent()) {
        (this.eventQueue.remove())();
    }
};

Circle.prototype.touchStart = function (data) {
    data.originalEvent.preventDefault();
    this.start = data.getLocalPosition(this.circle);
};

Circle.prototype.touchEnd = function (data) {
    data.originalEvent.preventDefault();
    this.start = null;
};

Circle.prototype.touchMove = function (data) {
    data.originalEvent.preventDefault();
    if (this.start) {
        var end = data.getLocalPosition(this.circle.parent);
        this.circle.position = {
            x: end.x - this.start.x,
            y: end.y - this.start.y
        };
    }
};

Circle.prototype.getCircle = function () {
    return this.circle;
};