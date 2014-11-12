define [
], () ->
  class NavigationController
    constructor: (@view) ->

      $("body").on "click", ".circle", () =>
        @view.setState "account"