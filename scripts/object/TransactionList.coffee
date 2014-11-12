define [
  'object/Element'
  'object/TransactionItem'
], (Element, TransactionItem) ->
  class TransactionList extends Element
    constructor: ->
      super document.createElement "ul"
      @attr "id", "transaction-list"
      @addClass "list-group"

      @append new TransactionItem "Test", "8414495", "12-11-2014", 2023
      @append new TransactionItem "Test", "8414495", "12-11-2014", 2023
      @append new TransactionItem "Test", "8414495", "28-3-2014", 2030
      @append new TransactionItem "Test", "8414495", "12-11-2014", 123