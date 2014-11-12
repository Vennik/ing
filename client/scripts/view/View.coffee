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

        vis = @visual
        $.ajax "/users/banks/all"
          .done (data) ->
            vis.update(data)
            console.log data.self
            # download all transactions for the user
            $.ajax "/users/transactions"
              .done (data) ->
                console.log data.self
                vis.updateTransactions JSON.parse data.self


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


    toggleTransactions: (data) ->
      if @state == "account"
        @visual
        .find ".listcontainer"
        .remove()

        container = new Div
        container.addClass "listcontainer"
        container.append new Title('Requests')
        container.append new RequestList
        container.append new Title('Transactions')
        container.append new TransactionList data
        @visual.append container

      if @state == "main"
        @visual
        .find ".listcontainer"
        .remove()