Router.map ->

  @route "events",
    path: "/events"
    controller: "BasicController"
    before: ->
      Meteor.subscribe "events"

  @route "singleEvent",
    path: "/events/:slug"
    waitOn: -> # wait for the subscription to be ready; see below
      Meteor.subscribe "singleEvent", @params.slug

    data: ->
      Events.first slug: @params.slug  if @ready()


  @route "adminEvents",
    path: "/admin/events"
    template: "eventsForm"
    controller: "AdminController"
    before: ->
      Meteor.subscribe "events"