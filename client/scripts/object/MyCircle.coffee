define [
  'object/Circle'
], (Circle) ->
  class MyCircle extends Circle
    constructor: ->
      super(arguments...)
      @addClass 'me'