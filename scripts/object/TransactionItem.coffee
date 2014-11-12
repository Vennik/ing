define [
  'object/Element'
], (Element) ->
  class TransactionItem extends Element
    constructor: (text) ->
      super document.createElement "li"
      @addClass "list-group-item"
      @html text