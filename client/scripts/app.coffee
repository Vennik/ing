require.config
  baseUrl: "dist/scripts"
  paths:
    "lib": "../../lib"
    "jquery": "../../lib/jquery/dist/jquery.min"
    "hammerjs": "../../lib/hammerjs/hammer.min"
    "jquery-hammerjs": "../../lib/jquery-hammerjs/jquery.hammer"
    "jquery.cookie": "../../lib/jquery.cookie/jquery.cookie"

require ['main', 'object/Element', 'jquery-hammerjs', 'jquery.cookie']