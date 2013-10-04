module.exports = ->
  # Project configuration
  @initConfig
    pkg: @file.readJSON 'package.json'
    
    ###
    # Build the browser Component
    component:
      install:
        options:
          action: 'install'
    component_build:
      'gss-engine':
        output: './browser/'
        config: './component.json'
        scripts: true
        styles: false
    ###

    # Automated recompilation and testing when developing
    watch:
      build:
        files: ['CustomEvent.coffee']
        tasks: ['build']
      test:
        files: ['spec/*.coffee', 'src/*.coffee']
        tasks: ['test']
    # CoffeeScript compilation
    coffee:
      src:
        options:
          bare: true
        expand: true
        src: ['CustomEvent.coffee']
        dest: './'
        ext: '.js'


    # BDD tests on browser
    mocha_phantomjs:
      all: ['spec/runner.html']

    # Cross-browser testing
    connect:
      server:
        options:
          base: ''
          port: 9999

    'saucelabs-mocha':
      all:
        options:
          urls: ['http://127.0.0.1:9999/spec/runner.html']
          browsers: [
            browserName: 'chrome'
          ,
            browserName: 'firefox'
          ,
            browserName: 'safari'
            platform: 'OS X 10.8'
            version: '6'
          ,
            browserName: 'opera'
          ,
            browserName: 'internet explorer'
            platform: 'WIN8'
            version: '10'
          ]
          build: process.env.TRAVIS_JOB_ID
          testname: 'GSS engine browser tests'
          tunnelTimeout: 5
          concurrency: 3
          detailedError: true

  # Grunt plugins used for building
  @loadNpmTasks 'grunt-component'
  @loadNpmTasks 'grunt-contrib-coffee'
  @loadNpmTasks 'grunt-component-build'

  # Grunt plugins used for testing
  @loadNpmTasks 'grunt-mocha-phantomjs'

  # Cross-browser testing in the cloud
  #@loadNpmTasks 'grunt-contrib-connect'
  #@loadNpmTasks 'grunt-saucelabs'

  #@registerTask 'build', ['coffee', 'concat', 'component', 'component_build', 'uglify']
  #@registerTask 'test', ['build',  'mocha_phantomjs']
  #@registerTask 'crossbrowser', ['coffeelint', 'build', 'mocha_phantomjs', 'connect', 'saucelabs-mocha']
  #@registerTask 'default', ['build']
