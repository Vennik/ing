define [
  'object/Div'
  'object/Image'
  'object/Element'
  'object/ButtonGroup'
  'object/HomeButton'
  'object/LogoutButton'
], (Div, Image, Element, ButtonGroup, HomeButton, LogoutButton) ->
  class Control extends Div
    constructor: (@view) ->
      super()
      @attr "id", "control"
      @addClass "well well-lg"

      @append new Image "images/ing.png"

      buttonGroup = new ButtonGroup()
      buttonGroup.append new HomeButton @view
      buttonGroup.append new LogoutButton @view
      @append buttonGroup