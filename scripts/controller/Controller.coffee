define [
  'controller/NavigationController'
], (NavigationController) ->
  class Controller
    constructor: (@view) ->

      new NavigationController(@view)