define [
  'object/Button'
  'view/Transactions'
], (Button, Transactions) ->
  class TransactionButton extends Button
    constructor: (@visual) ->
      super '<span>Transactions</span>'

      @click () =>
        @visual.empty()
        @visual.append new Transactions