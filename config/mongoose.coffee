exports.init = (compound) ->
  mongoose = require 'mongoose'
  conf = require('./database')[compound.app.set('env')];
  
  compound.db = 'initializing'
  
  connect = -> 
    return if compound.db == 'connected'
    console.log "Connecting to database on #{compound.app.set('env')}"
    mongoose.connect conf.url  

  mongoose.connection.on 'connected', -> 
    console.log "DB connection successful"
    compound.db = 'connected'

  mongoose.connection.on 'reconnected', -> 
    console.log "DB re-connection successful"
    compound.db = 'connected'

  mongoose.connection.on 'disconnected', -> 
    console.error "DB disconnected, re-trying connection in 5 seconds"
    compound.db = 'disconnected'
    setTimeout connect, 5000

  connect() # init the connection

  require(compound.root + '/db/schema')(mongoose, compound);
