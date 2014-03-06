  Accounts.onCreateUser (options,user) ->
    if (options.profile)
      options.profile.gravatar =
         Gravatar.imageUrl user.emails[0].address,
                    s: "150"
                    d: "http://mallorcaworkshops.org.s3.amazonaws.com/gears.png"
      user.profile = options.profile;
      user