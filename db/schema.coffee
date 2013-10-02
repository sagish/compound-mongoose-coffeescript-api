module.exports = (mongoose, compound) ->

  User = mongoose.model 'User', mongoose.Schema {
    name: String
    email: String
  }
  User.modelName = 'User'
  compound.models.User = User