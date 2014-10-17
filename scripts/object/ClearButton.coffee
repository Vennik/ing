define [
  'object/Button'
], (Button) ->
  class ClearButton extends Button
    constructor: (@visual, value) ->
      super value

      @click () =>
        @visual.empty()