
class @Events extends Minimongoid
  @_collection: new Meteor.Collection 'events'

  #who does the event belong to?
  @belongs_to: [
    name: 'teacher'
    identifier: 'userId'
  ]

  # debug logs when runing a query on this model
  @_debug: true

  @before_create: (event) ->
    event.slug = Events.slugify event.name
    event.attendees = []
    event.numberOfAttendees = 0
    event

  @slugify: (str) ->
    str.toLowerCase().replace(/[^\w ]+/g, "").replace(RegExp(" +", "g"), "-")

  validate: ->
    if @name and @name.length < 3
      throw new Meteor.Error(401, "Name is required and should be longer than 3")

    # If post is new, guard against duplicate slugs
    if not @id
      slug = Events.slugify @name
      if Events.first(slug: slug)
        @error 'taken', "Event with this slug already exists"


  attendEvent: (user) ->
    if not user
      # throw new Meteor.Error(401, "You have to register as a user to attend event")
      Meteor.Errors.throw("info","You have to register as a user to attend event")

    if _.contains @attendees, user._id
      Meteor.Errors.throw("warning","You are already attending the event")
      # throw new Meteor.Error(401, "You are already attending the event")

    else if @capacity - @numberOfAttendees < 1
      Meteor.Errors.throw("warning","The event is full bro!")

    else
      @push attendees: user._id
      @update numberOfAttendees: @numberOfAttendees + 1






Events._collection.allow
  insert: (userId, item) ->
    Roles.userIsInRole(userId, "admin")
    # Meteor.user()

  update: (userId, item, fields) ->
    Meteor.user()

  remove: (userId, item) ->
    Roles.userIsInRole(userId, "admin")