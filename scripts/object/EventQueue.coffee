define ->
  class EventQueue
    constructor: ->
      @events = []

    insert: (fn, context, params) ->
      @events.push ->
        fn.apply context, params

    remove: ->
      @events.shift()

    hasEvent: ->
      return @events.length > 0