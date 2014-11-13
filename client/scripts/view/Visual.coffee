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

      @hammer
          preventDefault: true
      .on "pan", (e) =>

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
      for item in @circles
        item.remove()

      @circles = []

      own = JSON.parse data.self
      other = data.fullAccess

      for item in own.list
        circle = new Circle item.customerDescription.split(",").reverse().join(" "), item.iban, @view
        @circles.push circle
        @append circle

      for item in other
        accounts = JSON.parse item.banks
        for account in accounts.list
          circle = new Circle account.customerDescription.split(",").reverse().join(" "), account.iban, @view
          @circles.push circle
          @append circle
