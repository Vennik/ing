define [
  'object/Element'
  'object/ActionGroup'
  'object/RequestButton'
], (Element, ActionGroup, RequestButton) ->
  class TransactionItem extends Element
    constructor: (description, account, date, amount) ->
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
                <option>Name 1</option>
                <option>Name 2</option>
                <option>Name 3</option>
                <option>Name 4</option>
              <select>
            </div>
          </div>
          <button type='submit' class='btn btn-primary'>Request</button>
        </form>
      </div>"

      @prepend "<div class='panel panel-default'>€ #{amount/100}</div>"

      @actionGroup = new ActionGroup
      @actionGroup.append new RequestButton amount
      @prepend @actionGroup