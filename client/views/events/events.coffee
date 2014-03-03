Template.events.rendered = ->



Template.events.helpers
  events: () ->
    return Events.find()

Template.events.events {}





Template.eventsForm.events

  'click .submit': (e,tpl) ->
    e.preventDefault()
    Events.create(
      user_id: Meteor.userId()
      name: $(tpl.find('#name')).val()
      date: $(tpl.find('#date')).val()
      aforo: $(tpl.find('#aforo')).val()
      duracion: $(tpl.find('#duracion')).val()
    )
