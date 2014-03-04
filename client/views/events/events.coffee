Template.events.rendered = ->



Template.events.helpers
  events: () ->
    return Events.find()
  teacher: () ->
    return Meteor.user(_id:@user_id).username


