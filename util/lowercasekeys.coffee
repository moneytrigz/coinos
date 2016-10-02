db = require('../redis')
db.keys('user:*', (err, obj) ->
  for key in obj
    db.rename(key, key.toLowerCase()) unless key is key.toLowerCase()
)

db.keys('*:transactions', (err, obj) ->
<<<<<<< 9d68abf815d51c06a3403cda294e1cf65f658daa
  for user in obj
    db.rename(user, user.toLowerCase()) unless user is user.toLowerCase()
)

console.log('All done!')
process.exit()
=======
  for key in obj
    db.rename(key, key.toLowerCase()) unless key is key.toLowerCase()
)

db.keys('*:transactions:*', (err, obj) ->
  for key in obj
    db.rename(key, key.toLowerCase()) unless key is key.toLowerCase()
)

>>>>>>> Rename transaction keys to lowercase
