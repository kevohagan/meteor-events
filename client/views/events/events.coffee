Template.events.rendered = ->
  $("#events-header").transition "rollIn", "2s"
  return


Template.events.helpers
  events: () ->
    return Events.find {},
            sort:
              date: -1

  # teacher: () ->
  #   Meteor.users.findOne(
  #     _id: @teacher_id
  #   ,
  #     fields:
  #       username: 1
  #   ).username



