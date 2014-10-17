define [
  '../../.tmp/scripts/object/Div'
], (Div) ->
  class Visual extends Div
    constructor: () ->
      super()
      @attr "id", "visual"