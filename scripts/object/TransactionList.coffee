define [
  'object/Element'
  'object/TransactionItem'
], (Element, TransactionItem) ->
  class TransactionList extends Element
    constructor: ->
      super document.createElement "ul"
      @attr "id", "transaction-list"
      @addClass "list-group"

      @append new TransactionItem "Test"
      @append new TransactionItem "Test"
      @append new TransactionItem "Test"
      @append new TransactionItem "Test"