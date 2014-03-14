define ['app', 'marionette', 'config', 'templates'], (App, Marionette, config, templates) ->

  class UserView extends Marionette.ItemView
    template: templates.user
