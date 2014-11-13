require.config
  baseUrl: "dist/scripts"
  paths:
    "lib": "../../lib"
    "jquery": "../../lib/jquery/dist/jquery.min"
    "bootstrap": "../../lib/bootstrap/dist/js/bootstrap.min"
    "jquery.cookie": "../../lib/jquery.cookie/jquery.cookie"

require ['main', 'object/Element', 'jquery', 'bootstrap', 'jquery.cookie']