module.exports = (passport) ->
  new: (req, res) ->
    res.render('sessions/new')

  create: (req, res, next) ->
    passport.authenticate('local', (err, user, info) ->
      if (err)
        return next(err)
      if (!user) 
        return res.render('sessions/new', badpw: true)
      req.login(user, (err) ->
        if (err) 
          return next(err)
        url = "/#{user.username}/edit" 
        return res.redirect(url)
      )
    )(req, res, next)

  destroy: (req, res) ->
    req.logout()
    res.redirect('/login')
