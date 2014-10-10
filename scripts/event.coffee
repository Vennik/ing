define [

], () ->
    RENDEREVENT: 'render'
    render: () ->
      document.dispatchEvent(new Event(@RENDEREVENT))

    listen: (elem, func) ->
      elem.addEventListener(@RENDEREVENT, func)