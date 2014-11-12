define [
  'object/A',
  'object/Element'
], (A, Element) ->
  class Circle extends A
    constructor: (@name, @account) ->
      super()

      @addClass "circle"

      @append new Element "<span class='name'>#{@name}</span>"
      @append new Element "<span class='account'>#{@account}</span>"