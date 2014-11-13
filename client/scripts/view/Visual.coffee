define [
  'object/Div'
  'object/Circle'
  'view/View'
], (Div, Circle, View) ->
  class Visual extends Div
    constructor: (@view) ->
      super()
      @attr "id", "visual"

      @circles = []

    circlesToLeft: ->
      for circle in @circles
        do (circle) ->
          circle.setLeft _i

    circlesToMain: ->
      for circle in @circles
        do (circle) ->
          circle
          .setMain _i
          .removeClass "active"


    updateTransactions: (data) ->


    update: (data) ->
      console.log data
      for item in @circles
        item.remove()

      @circles = []

      own = JSON.parse data.self
      other = data.fullAccess

      for item in own.list
        circle = new Circle item.customerDescription.split(",").reverse().join(" "), $.cookie('user'), item.iban, item.availableBalance.value, @view
        @circles.push circle
        @append circle

      for item in other
        accounts = JSON.parse item.products
        for account in accounts.list
          circle = new Circle account.customerDescription.split(",").reverse().join(" "), item.person, account.iban, account.availableBalance.value, @view
          @circles.push circle
          @append circle
