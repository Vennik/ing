define [
  'object/Div'
  'object/ActionGroup'
], (Div, ActionGroup) ->
  class ActionGroup extends Div
    constructor: (description, account, date) ->
      super()
      @addClass "btn-group"