define [
  'object/Element'
  'object/ActionGroup'
  'object/AcceptButton'
  'object/RejectButton'
], (Element, ActionGroup, AcceptButton, RejectButton) ->
  class RequestItem extends Element
    constructor: (description, account, date, amount) ->
      super document.createElement "li"
      @addClass "list-group-item clearfix"
      @html "
            <span class='date'>#{date}</span><strong>#{description}</strong><br />#{account}
            "

      @prepend "<div class='panel panel-default'>€ #{amount/100}</div>"

      @actionGroup = new ActionGroup
      @actionGroup.append new AcceptButton
      @actionGroup.append new RejectButton
      @prepend @actionGroup