define ['app', 'marionette', 'models/user', 'views/user', 'views/visitor'], (App, Marionette, User, UserView, VisitorView) ->

  class Controller extends Marionette.Controller

    root: ->
      Hull.on 'hull.init', (hull, me, app, org) => @check_user_state me

    check_user_state: (me) ->
      console.log "in check user state"
      if me
        App.main.show(new UserView(model: new User(me)))
      else
        App.main.show(new VisitorView)
