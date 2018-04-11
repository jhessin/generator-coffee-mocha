Generator = require 'yeoman-generator'
chalk = require 'chalk'
yosay = require 'yosay'

module.exports = class extends Generator
  writing: ->
    @fs.copy @templatePath('.vscode'),
      @destinationPath('.vscode')

    @fs.copy @templatePath('test'),
      @destinationPath('test')
    @fs.extendJSON 'package.json',
      scripts:
        test: 'mocha'

  install: ->
    @yarnInstall [
      'coffeescript', 'coffee-babel'
      'mocha'
    ]
    return
