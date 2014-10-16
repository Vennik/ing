require.config
  baseUrl: ".tmp"
  paths:
    "lib": "../lib"
    "jquery": "../lib/jquery/dist/jquery"
    "hammerjs": "../lib/hammerjs/hammer"
    "jquery-hammerjs": "../lib/jquery-hammerjs/jquery.hammer"

require ['main', 'object/Element', 'jquery-hammerjs']