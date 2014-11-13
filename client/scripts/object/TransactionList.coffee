define [
  'object/Element'
  'object/TransactionItem'
], (Element, TransactionItem) ->
  class TransactionList extends Element
    constructor: (@id, @account, @data) ->
      super document.createElement "ul"

      @attr "id", "transaction-list"
      @addClass "list-group loading"

      names = new Array()
      vis = @visual
      $.ajax "/users/transactions/" + @id
      .done (data) =>
        console.log data
        for transaction in data.list
          date = new Date(transaction.accountingDate.datetime)
          date = date.getDay() + "-" + date.getMonth() + "-" + date.getFullYear()
          @append new TransactionItem @id, @account, transaction, names

        @removeClass "loading"