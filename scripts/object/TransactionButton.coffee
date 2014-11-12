define [
  'object/Button'
], (Button) ->
  class TransactionButton extends Button
    constructor: (@visual) ->
      super '<span>Transactions</span>'

      @click () =>
        @visual.empty()