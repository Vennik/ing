define [
  'object/Button'
], (Button) ->
  class ClearButton extends Button
    constructor: (@stage, value) ->
      super value

      @click () =>
        @stage.find("> .circle").remove()