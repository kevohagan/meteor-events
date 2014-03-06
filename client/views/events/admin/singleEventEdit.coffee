Template.singleEventEdit.rendered = () ->



Template.singleEventEdit.events
  'click .submit': () ->
    e.preventDefault()
    Events.update(
      teacher_id: Meteor.userId()
      name: $(tpl.find('#name')).val()
      date: $(tpl.find('#date')).val()
      capacity: $(tpl.find('#capacity')).val()
      location: $(tpl.find('#location')).val()
      duracion: $(tpl.find('#duracion')).val()
      description: $(tpl.find('#description')).val()
    )

  'click .delete': (e, tpl) ->
    e.preventDefault()
    if confirm 'Are you sure?'
      @destroy()
      Router.go 'adminEvents'