define [
  'object/Element'
  'object/ActionGroup'
  'object/RequestButton'
], (Element, ActionGroup, RequestButton) ->
  class TransactionItem extends Element
    constructor: (description, account, date) ->
      super document.createElement "li"
      @addClass "list-group-item clearfix"
      @html "
      <span class='date'>#{date}</span><strong>#{description}</strong><br />#{account}
      <div class='drop'>Test</div>"

      @actionGroup = new ActionGroup
      @actionGroup.append new RequestButton
      @prepend @actionGroup