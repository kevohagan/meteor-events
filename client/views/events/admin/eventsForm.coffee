Template.eventsForm.rendered = (tpl) ->
  $(tpl.find('#name')).val()  ''

Template.eventsForm.helpers
  events: () ->
    return Events.find()


Template.eventsForm.events

  'click .submit': (e,tpl) ->
    e.preventDefault()
    Events.create(
      teacher_id: Meteor.userId()
      name: $(tpl.find('#name')).val()
      date: $(tpl.find('#date')).val()
      capacity: $(tpl.find('#capacity')).val()
      location: $(tpl.find('#location')).val()
      duracion: $(tpl.find('#duration')).val()
      description: $(tpl.find('#description')).val()
    )

  'click .delete': (e,tpl) ->
    if confirm 'Are you sure?'
      @destroy()

