define [
  'object/Element'
  'object/ActionGroup'
  'object/RequestButton'
], (Element, ActionGroup, RequestButton) ->
  class TransactionItem extends Element
    constructor: (transaction, names) ->
      super document.createElement "li"

      date = new Date(transaction.accountingDate.datetime)
      date = date.getDay() + "-" + date.getMonth() + "-" + date.getFullYear()


      @addClass "list-group-item clearfix"
      @html "
      <span class='date'>#{date}</span><strong>#{transaction.description ?= "No description"}</strong>
      <br />#{transaction.productId} <span class='glyphicon glyphicon-arrow-right'></span> #{transaction.counterpartProductId}
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

      @prepend "<div class='panel panel-default'>#{transaction.currency.code} #{parseFloat(transaction.amount.value).toFixed(2)}</div>"

      @actionGroup = new ActionGroup
      @actionGroup.append new RequestButton transaction.amount.value
      @prepend @actionGroup