/**
 * Created by René on 9-10-2014.
 */

EventQueue = function() {

    this.events = [];

};

EventQueue.prototype.insert = function(fn, context, params) {

    this.events.push(function() {
        fn.apply(context, params);
    });

};

EventQueue.prototype.remove = function() {

    return this.events.shift();

};

EventQueue.prototype.hasEvent = function () {

    return this.events.length > 0;

};