Meteor.publish "events", ->
  Events.find {}


Meteor.publish 'singleEvent', (slug) ->

  check slug, String

  Events.find slug: slug