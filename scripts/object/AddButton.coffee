define [
  'object/Button'
  'object/RedCircle'
  'object/GreenCircle'
], (Button, RedCircle, GreenCircle) ->
  class Div extends Button
    constructor: (@visual) ->
      super '<span class="glyphicon glyphicon-plus"></span>'

      @click () =>
        if Math.random() > 0.5
          @visual.append new RedCircle 100 + Math.random() * 600, 100 + Math.random() * 600, 75 + Math.random() * 75
        else
          @visual.append new GreenCircle 100 + Math.random() * 600, 100 + Math.random() * 600, 75 + Math.random() * 75