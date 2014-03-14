define ['app', 'marionette', 'templates'], (App, Marionette, templates) ->

  class VisitorView extends Marionette.ItemView
    template: templates.visitor

    # ui:
    #   'login_btn': '#fb-button'
    #
    # events:
    #   'click @ui.login_btn': 'login'
    #
    # login: ->
    #   Hull.login('facebook', { display: 'popup'} ).then (user) ->
    #     App.request('router').options.controller.check_user_state(user)
