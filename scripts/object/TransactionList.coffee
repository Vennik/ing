define [
  'object/ListGroup'
  'object/TransactionItem'
], (ListGroup, TransactionItem) ->
  class TransactionList extends ListGroup
    constructor:  ->
      super()
      @attr "id", "transactions"
      @addClass "list-group"
      data()

  data: ->
    @append new TransactionItem()
