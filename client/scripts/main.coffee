define [
  'view/View'
  'object/Circle'
  'controller/Controller'
], (View, Circle, Controller) ->

  view = new View "login"

  control = new Controller view