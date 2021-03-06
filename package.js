Package.describe({
  summary: "Meteor events management"
});

Package.on_use(function (api) {
  var both = ['client', 'server'];


//Which other packages to use


 api.use([
  'coffeescript',
  'ms-seo',
  'gravatar',
  'accounts-base',
  'minimongoid'
  ], both);

  api.use([
    'templating',
    'handlebars',
    'underscore',
    'iron-router',
    'meteor-errors-sui',
    'moment',
    'semantic-ui'
  ], 'client');


//Adding your files to app

  //on both
  api.add_files([
    'collections.coffee'
  ], both);

  //on the client
  api.add_files([
    'client/boot.coffee',
    'client/views/events/events.html',
    'client/views/events/events.coffee',
    'client/views/events/events.css',
    'client/views/events/singleEvent.html',
    'client/views/events/singleEvent.coffee',
    'client/views/events/singleEvent.css',
    'client/views/events/admin/eventsForm.html',
    'client/views/events/admin/eventsForm.coffee',
    'client/views/events/admin/singleEventEdit.html',
    'client/views/events/admin/singleEventEdit.coffee',
    'router.coffee',
  ], 'client');


  //on the server
  api.add_files([
    'server/accounts.coffee',
    'publications.coffee'
  ], "server");



});