Template.singleEvent.helpers
  placesLeft: () ->
    @capacity - @numberOfAttendees

  usersGoing: () ->
    Meteor.users.find _id:
      $in: @attendees



Template.singleEvent.events
  'click .attend': (e, tpl) ->
    user = Meteor.user()
    event = Events.first(@id)
    if !Meteor.user()
      Meteor.Errors.throw("error","You have to register as a user to attend event")
    else
      event.attendEvent(user)
      # Meteor.Errors.throw("You have to register as a user to attend event")
      # throw new Meteor.Error(401, "You have to register as a user to attend event")


Template.singleEvent.rendered = () ->
  $(document).ready ->
  changeSides = ->
    $(".ui.shape").eq(0).shape("flip over").end().eq(1).shape("flip over").end().eq(2).shape("flip back").end().eq(3).shape("flip back").end()
    return

  validationRules = firstName:
    identifier: "email"
    rules: [
      {
        type: "empty"
        prompt: "Please enter an e-mail"
      }
      {
        type: "email"
        prompt: "Please enter a valid e-mail"
      }
    ]

  $(".ui.form").form validationRules,
    on: "blur"

  $(".masthead .information").transition "scale in"
  # setInterval changeSides, 3000
  return
