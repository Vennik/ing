'use strict'

module.exports = ( grunt ) ->
  require('time-grunt')(grunt)
  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    config:
      scripts: "scripts"
      tmp: ".tmp"

    clean:
      dev: [
        '<%= config.tmp %>'
      ]

    coffee:
      dev:
        options:
          sourceMap: true
          bare: true
        files: [
          expand: true
          cwd: '<%= config.scripts %>'
          src: '**/*.coffee'
          dest: '<%= config.tmp %>'
          ext: '.js'
        ]

    watch:
      options:
        livereload: true
        spawn: false

      coffee:
        files: ['<%= config.scripts %>/**/*.coffee']
        tasks: ['newer:coffee:dev']

  grunt.registerTask 'default', [
    "clean:dev"
    "coffee:dev"
  ]
