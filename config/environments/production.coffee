express = require 'express'

module.exports = (compound) ->
  app = compound.app
  app.configure 'production', ->
    app.enable 'quiet'
    # app.disable 'assets timestamps'
    app.use express.errorHandler()
