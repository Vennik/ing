define [
  'object/ListGroup'
  'object/Image'
  'object/TransactionItem'
  'object/TransactionList'
], (ListGroup, Image, TransactionItem, TransactionList) ->
  class Transactions extends TransactionList
    constructor: (@visual) ->
      super()