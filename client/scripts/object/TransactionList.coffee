define [
  'object/Element'
  'object/TransactionItem'
], (Element, TransactionItem) ->
  class TransactionList extends Element
    constructor: (@data) ->
      super document.createElement "ul"
      @attr "id", "transaction-list"
      @addClass "list-group"

      vis = @visual
      $.ajax "/users/banks/allOpen",
        dataType: "json"
        type: "POST"
        data: {'userId': $.cookie("user"), 'token' : $.cookie("token")}
      .done (data) ->
        console.log(data)
        banks = JSON.parse(data.fullAccess[0].banks)
        length = banks.list.length
        name = new Array()
        i = 0
        for account in banks.list
          name[i] = account.customerDescription
          i++

      for transaction in @data
        date = new Date(transaction.accountingDate.datetime)
        date = date.getDay() + "-" + date.getMonth() + "-" + date.getFullYear()
        @append new TransactionItem transaction.description ?= "", transaction.counterpartProductId, date, transaction.amount.value
