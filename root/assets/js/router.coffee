define ['app', 'marionette', 'hull', 'config', 'routefilter'], (App, Marionette, Hull, config) ->

  class Router extends Marionette.AppRouter
    appRoutes:
      "": "root"

    before: (route, params) ->
      Hull.init config.hull, (hull, me, app, org) ->
