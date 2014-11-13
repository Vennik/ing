define [
  'object/Element'
  'object/RequestItem'
], (Element, RequestItem) ->
  class RequestList extends Element
    constructor: (@view) ->
      super document.createElement "ul"
      @attr "id", "request-list"
      @addClass "list-group"

      @append new RequestItem "Hoi", "8414495", "12-11-2014", 2023, @view
      @append new RequestItem "Test", "8414495", "12-11-2014", 2023, @view
      @append new RequestItem "Test", "8414495", "28-3-2014", 2030, @view
      @append new RequestItem "Test", "8414495", "12-11-2014", 123, @view