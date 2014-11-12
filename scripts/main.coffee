define [
  'view/View'
  'object/Circle'
  'controller/Controller'
], (View, Circle, Controller) ->

  stage = new View

  control = new Controller stage