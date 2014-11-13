define [
  'object/Element'
  'object/TransactionItem'
], (Element, TransactionItem) ->
  class TransactionList extends Element
    constructor: (@id, name, others) ->
      super document.createElement "ul"

      @attr "id", "transaction-list"
      @addClass "list-group loading"

      $.ajax "/users/transactions/" + @id
      .done (data) =>
        console.log data
        for transaction in data.list
          date = new Date(transaction.accountingDate.datetime)
          date = date.getDay() + "-" + date.getMonth() + "-" + date.getFullYear()
          @append new TransactionItem @id, name, transaction, others
      .error (error) =>
        console.log error
        @before '<div class="alert alert-danger" role="alert">Permission Denied</div>'

        @removeClass "loading"