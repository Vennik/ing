define [
  'object/Element'
  'object/TransactionItem'
], (Element, TransactionItem) ->
  class TransactionList extends Element
    constructor: (@data) ->
      super document.createElement "ul"
      @attr "id", "transaction-list"
      @addClass "list-group"

      console.log(@data)
      for transaction in @data
        date = new Date(transaction.accountingDate.datetime)
        date = date.getDay() + "-" + date.getMonth() + "-" + date.getFullYear()
        @append new TransactionItem transaction.description ?= "", transaction.counterpartProductId, date, transaction.amount.value
