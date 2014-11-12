define [
  'object/Element'
], (Element) ->
  class TransactionItem extends Element
    constructor: ->
      super document.createElement "li"
      @addClass "list-group-item"