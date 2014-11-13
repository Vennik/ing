define [
  'object/Element'
  'object/ActionGroup'
  'object/RequestButton'
], (Element, ActionGroup, RequestButton) ->
  class TransactionItem extends Element
    constructor: (@account, transaction, names) ->
      super document.createElement "li"

      date = new Date(transaction.accountingDate.datetime)
      date = date.getDay() + "-" + date.getMonth() + "-" + date.getFullYear()


      @addClass "list-group-item clearfix"
      @html "
      <span class='date'>#{date}</span><strong>#{transaction.description ?= "No description"}</strong>
      #{transaction.productId} <span class='glyphicon glyphicon-arrow-right'></span> #{transaction.counterpartProductId}
      <div class='drop'>
        <form class='request-form form-inline'>
          <div class='form-group'>
            <div class='input-group'>
              <div class='input-group-addon'><span class='glyphicon glyphicon-user'></span></div>
              <input type='hidden' name='bedrag' value='#{transaction.amount.value}'>
              <input type='hidden' name='naariban' value='#{@account}'>
              <select name='vaniban' class='form-control'>

                <option>Select name</option>
               <select>
            </div>
            <div class='input-group'>
              <div class='input-group-addon'><span class='glyphicon glyphicon-info-sign'></span></div>
              <input type='text' class='form-control' placeholder='Add note'>
            </div>
          </div>
          <button type='submit' class='btn btn-primary'>Request</button>
        </form>
      </div>"

      for name in names
        @find("select").append("<option value='#{name[1]}'>#{name[0]}</option>")

      @prepend "<div class='panel panel-default'>€ #{parseFloat(transaction.amount.value).toFixed(2)}</div>"

      @actionGroup = new ActionGroup
      @actionGroup.append new RequestButton transaction.amount.value
      @prepend @actionGroup

      @.find ".request-form"
      .submit (e) ->
        e.preventDefault()
        if confirm "Are you sure?"
          $.ajax "/users/request/create",
            data: $(@).serializeArray()
          .done (data) ->
