define ['app', 'marionette'], (App, Marionette) ->

  class Controller extends Marionette.Controller

    root: ->
      Hull.on 'hull.init', (hull, me, app, org) ->
        console.log me
