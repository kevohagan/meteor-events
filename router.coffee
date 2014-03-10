Router.map ->

  @route "events",
    path: "/events"
    controller: "BasicController"
    before: ->
      @subscribe("events").wait()

  @route "singleEvent",
    path: "/events/:slug"
    before: -> # wait for the subscription to be ready; see below
     @subscribe("singleEvent", @params.slug).wait()

    data: ->
      Events.first slug: @params.slug  if @ready()


  @route "adminEvents",
    path: "/admin/events"
    template: "eventsForm"
    controller: "AdminController"
    before: ->
      Meteor.subscribe "events"


  @route 'singleEventEdit',
    path: '/admin/events/edit/:slug'
    waitOn: ->
      Meteor.subscribe "singleEvent", @params.slug
    data: ->
      Events.first slug: @params.slug  if @ready()


    # before: ->
    #   if Blog.settings.blogAdminEditTemplate
    #     @template = Blog.settings.blogAdminEditTemplate

    #   if Meteor.loggingIn()
    #     return @stop()

    #   Meteor.call 'isBlogAuthorized', (err, authorized) =>
    #     if not authorized
    #       return @redirect('/blog')

      # Set up our own 'waitOn' here since IR does not atually wait on 'waitOn'
      # (see https://github.com/EventedMind/iron-router/issues/265).
      # @subscribe('singlePost', @params.slug).wait()
