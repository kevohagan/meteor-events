Template.singleEvent.helpers
  placesLeft: () ->
    @aforo - @numberOfAttendees

  usersGoing: () ->
    Meteor.users.find _id:
      $in: @attendees



Template.singleEvent.events
  'click .attend': (e, tpl) ->
    user = Meteor.user()
    event = Events.first(@id)
    if Meteor.user()
      event.attendEvent(user)
    else
      Meteor.Errors.throw("You have to register as a user to attend event")
      throw new Meteor.Error(401, "You have to register as a user to attend event")


