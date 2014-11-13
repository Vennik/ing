require.config
  baseUrl: "dist/scripts"
  paths:
    "lib": "../../lib"
    "jquery": "../../lib/jquery/dist/jquery.min"
    "jquery.cookie": "../../lib/jquery.cookie/jquery.cookie"

require ['main', 'object/Element', 'jquery.cookie']