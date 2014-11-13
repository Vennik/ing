define [
], () ->
  class Element extends jQuery
    constructor: (selector, context) ->
      # When selector is a string and not an html tag:
      # body, #my-id, .error-class etc.
      if typeof selector is 'string' and not selector.match /^<.*>$/
        jQuery.extend(
          true,
          this,
          jQuery.fn.init selector, context, jQuery document
        )

      # When selector is a jQuery object
      else if selector instanceof jQuery
        jQuery.extend(
          true,
          this,
          selector
        )

      else
        # When selector points to an object which doesn't exist in the DOM:
        # <div>, document.createElement('span')
        # Or when selector is an object
        jQuery.fn.init.call this, selector, context

      @constructor = jQuery
