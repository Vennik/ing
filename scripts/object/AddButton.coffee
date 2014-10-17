define [
  'object/Button'
  'object/RedCircle'
  'object/GreenCircle'
], (Button, RedCircle, GreenCircle) ->
  class Div extends Button
    constructor: (@stage, value) ->
      super value

      @click () =>
        if Math.random() > 0.5
          @stage.append new RedCircle 100 + Math.random() * 600, 100 + Math.random() * 600, 75 + Math.random() * 75
        else
          @stage.append new GreenCircle 100 + Math.random() * 600, 100 + Math.random() * 600, 75 + Math.random() * 75