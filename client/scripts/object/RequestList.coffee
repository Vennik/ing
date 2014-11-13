define [
  'object/Element'
  'object/RequestItem'
], (Element, RequestItem) ->
  class RequestList extends Element
    constructor: (@view) ->
      super document.createElement "ul"
      @attr "id", "request-list"
      @addClass "list-group loading"

      $.ajax '/users/requests/all'
        .done (data) =>
          for request in data.requests
            @append new RequestItem request.tid, request.notitie, request.naarIban, '13-11-2014  ', request.bedrag, @view
          @removeClass "loading"

