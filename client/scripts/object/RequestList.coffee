define [
  'object/Element'
  'object/RequestItem'
], (Element, RequestItem) ->
  class RequestList extends Element
    constructor: (@view) ->
      super document.createElement "ul"
      @attr "id", "request-list"
      @addClass "list-group"

      $.ajax '/users/requests/all'
        .done (data) =>
          for request in data.requests
            @append new RequestItem request.notitie, request.naarIban, null, request.bedrag, @view