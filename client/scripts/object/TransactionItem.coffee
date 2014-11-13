define [
  'object/Element'
  'object/ActionGroup'
  'object/RequestButton'
], (Element, ActionGroup, RequestButton) ->
  class TransactionItem extends Element
    constructor: (description, account, date, amount, names) ->
      super document.createElement "li"


      @addClass "list-group-item clearfix"
      @html "
      <span class='date'>#{date}</span><strong>#{description}</strong><br />#{account}
      <div class='drop'>
        <form class='form-inline'>
          <div class='form-group'>
            <div class='input-group'>
              <div class='input-group-addon'><span class='glyphicon glyphicon-user'></span></div>
              <select class='form-control'>

                <option>Select name</option>
               <select>
            </div>
          </div>
          <button type='submit' class='btn btn-primary'>Request</button>
        </form>
      </div>"
      for name in names
        @find("select").append("<option>#{name}</option>")
      @prepend "<div class='panel panel-default'>€ #{amount}</div>"


      @actionGroup = new ActionGroup
      @actionGroup.append new RequestButton amount
      @prepend @actionGroup