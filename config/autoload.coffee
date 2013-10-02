module.exports = (compound) ->
  defaultModules = [
  ]

  developmentModules = []
  if compound.app.get('env') is 'development'
    developmentModules = [
    ]

  unless window?
    return defaultModules.concat(developmentModules).map(require)
  else
    return []