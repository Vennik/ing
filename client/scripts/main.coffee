define [
  'view/View'
  'object/Circle'
  'controller/Controller'
], (View, Circle, Controller) ->

  view = new View "main"

  control = new Controller view