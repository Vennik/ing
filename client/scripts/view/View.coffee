define [
  'object/Element'
  'object/TransactionList'
  'object/RequestList'
  'object/Title'
  'object/Div'
  'view/Visual'
  'view/Control'
  'view/Login'
], (Element, TransactionList, RequestList, Title, Div, Visual, Control, Login) ->
  class View extends Element
    constructor: (@state) ->
      super "body"

      if !$.cookie("token")
        @append new Login @
      else
        @setState "main"

    setState: (state) ->
      @prevstate = @state;
      @state = state

      if @prevstate == "login"
        @visual = new Visual this
        @append @visual
        @append new Control @

        $.ajaxSetup
          type: "POST"
          dataType: "json"

        @visual.addClass "loading"
        $.ajax "/users/products/all"
          .done (data) =>
            @visual.update(data)
          .always =>
            @visual.removeClass "loading"

      if @state == "login"
        @html ''
        @append new Login @

      if @state == "account"
        @visual.circlesToLeft()

      if state == "main"
        @visual.circlesToMain()

        @visual
        .find ".listcontainer"
        .remove()

        @visual
        .removeClass "transaction-pending"
        .find "#accept-transaction"
        .remove()


    toggleTransactions: (id, name) ->
      if @state == "account"
        @visual
        .find ".listcontainer"
        .remove()

        container = new Div
        container.addClass "listcontainer"
        container.append new Title('My Requests')
        container.append new RequestList @
        container.append new Title('Transactions of ' + name)
        container.append new TransactionList id, name, @visual.others
        @visual.append container

      if @state == "main"
        @visual
        .find ".listcontainer"
        .remove()