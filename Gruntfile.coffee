module.exports = (grunt) ->
  grunt.initConfig
    clean:
      js: [
        'lib/'
        'index.js'
      ]

    coffeelint:
      options:
        configFile: 'coffeelint.json'
      app: ['src/**/*.coffee']

    coffee:
      compile:
        files: [
          expand: true
          cwd: 'src/'
          src: ['**/*.coffee']
          dest: '.'
          ext: '.js'
        ]
    mochaTest:
      options:
        reporter: 'spec'
      src: ['test/test.coffee']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-mocha-test'

  grunt.registerTask 'test', ['clean:js', 'coffeelint', 'coffee', 'mochaTest']
  grunt.registerTask 'default', ['clean:js', 'coffeelint', 'coffee']
