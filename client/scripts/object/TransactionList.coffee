define [
  'object/Element'
  'object/TransactionItem'
], (Element, TransactionItem) ->
  class TransactionList extends Element
    constructor: (@account, @data) ->
      super document.createElement "ul"


      @attr "id", "transaction-list"
      @addClass "list-group"
      names = new Array()
      vis = @visual
      $.ajax "/users/products/allOpen"
      .done (data) =>
        console.log data
        if data.fullAccess[0]
          products = JSON.parse(data.fullAccess[0].products)
          length = products.list.length
          for account in products.list
            if (account.id)[0] != 'T'
              names.push([account.customerDescription, account.id])

        for transaction in @data
          date = new Date(transaction.accountingDate.datetime)
          date = date.getDay() + "-" + date.getMonth() + "-" + date.getFullYear()
          @append new TransactionItem @account, transaction, names
