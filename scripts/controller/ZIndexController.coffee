define [
  'object/Element'
], (Element) ->
  """
  This class takes care of z-positioning of the circles
  """
  BASE_ZINDEX = 1
  class ZIndexController
    constructor: ->
      @circles = []

      new Element("body").
        on 'touchstart mousedown',(eve) => # on touchstart or mousedown the z-index must be controlled
          if eve.target.className.indexOf("circle") isnt -1 # if this is a circle
            i = @circles.indexOf(eve.target)
            if (i = @circles.indexOf eve.target) isnt -1
              @circles.splice i, 1 # remove circle from list if it exists

            @circles.push eve.target # add the circle to the list

            @circles.forEach (t, i) ->
              t.style.zIndex = BASE_ZINDEX + i # reset all the indexes of the circles