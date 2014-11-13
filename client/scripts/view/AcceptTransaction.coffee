define [
  'object/Element'
], (Element) ->
  class AcceptTransaction extends Element
    constructor: (@view) ->
      super document.createElement "iframe"

      @attr "id", "accept-transaction"

      @mainsrc = "https://tweakers.net/"
      @reset()

    reset: () ->
      @attr "src", @mainsrc