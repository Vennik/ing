define [
  'object/Element'
  'object/TransactionItem'
], (Element, TransactionItem) ->
  class TransactionList extends Element
    constructor: (@data) ->
      super document.createElement "ul"


      @attr "id", "transaction-list"
      @addClass "list-group"
      names = new Array()
      vis = @visual
      $.ajax "/users/products/allOpen"
      .done (data) =>
        if data.fullAccess[0]
          products = JSON.parse(data.fullAccess[0].products)
          length = products.list.length

          i = 0
          for account in products.list
            names[i] = account.customerDescription
            i++

        for transaction in @data
          date = new Date(transaction.accountingDate.datetime)
          date = date.getDay() + "-" + date.getMonth() + "-" + date.getFullYear()
          @append new TransactionItem transaction, names
