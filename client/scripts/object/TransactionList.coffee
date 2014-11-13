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
      $.ajax "/users/products/allOpen"
      .done (data) =>
        console.log data
        if data.fullAccess[0]
          for person in data.fullAccess
            products = JSON.parse(person.products)

            length = products.list.length
            for account in products.list
              if (account.id)[0] != 'T'
                console.log account
                names.push([account.customerDescription, account.id, data.fullAccess[0].person])

        for transaction in @data
          date = new Date(transaction.accountingDate.datetime)
          date = date.getDay() + "-" + date.getMonth() + "-" + date.getFullYear()
          @append new TransactionItem @id, @account, transaction, names

        @removeClass "loading"