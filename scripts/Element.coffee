define [
  'jquery'
], (jQuery) ->
  class Element extends jQuery
    constructor: (selector, context) ->
      # When selector is a string and an existing object: body, #my-id, .error-class etc.
      if not /^<.*>$/.exec selector
        #@[key] = val for own key, val of jQuery.fn.init selector, context, jQuery document
        jQuery.extend(true, this, jQuery.fn.init selector, context, jQuery document)
        return

      # When selector points to an object which doesn't exist in the DOM: <div>, document.createElement('span')
      # Or when selector is an object
      jQuery.fn.init.call this, selector, context

