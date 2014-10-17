'use strict'

module.exports = (grunt) ->
  require('time-grunt')(grunt)
  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    config:
      scripts: "scripts"
      styles: "styles"
      tmp: "dist"

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
          dest: '<%= config.tmp %>/<%= config.scripts %>'
          ext: '.js'
        ]

    less:
      dev:
        files: [
          expand: true
          cwd: '<%= config.styles %>'
          src: '**/*.less'
          dest: '<%= config.tmp %>/<%= config.styles %>'
          ext: '.css'
        ]

    watch:
      options:
        spawn: false
        atBegin: true
        livereload: true

      coffee:
        files: ['<%= config.scripts %>/**/*.coffee']
        tasks: ['coffee:dev']

      less:
        files: ["<%= config.styles %>/**/*.less"]
        tasks: ['less:dev']

  changedLess = Object.create null
  changedCoffee = Object.create null

  updateCoffee = grunt.util._.debounce(() ->
    grunt.config 'coffee.dev.files.0.cwd', ''
    grunt.config 'coffee.dev.files.0.src', Object.keys(changedCoffee)
    grunt.config 'coffee.dev.files.0.dest', '<%= config.tmp %>'
    changedCoffee = Object.create null
  , 200)

  updateLess = grunt.util._.debounce(() ->
    grunt.config 'less.dev.files.0.cwd', ''
    grunt.config 'less.dev.files.0.src', Object.keys(changedCoffee)
    grunt.config 'less.dev.files.0.dest', '<%= config.tmp %>'
    changedLess = Object.create null
  , 200)

  grunt.event.on 'watch', (action, filepath, target) ->
    switch target
      when "less"
        changedLess[filepath] = action
        updateLess()
      when "coffee"
        changedCoffee[filepath] = action
        updateCoffee()


  grunt.registerTask 'default', [
    "clean:dev"
    "less:dev"
    "coffee:dev"
  ]
