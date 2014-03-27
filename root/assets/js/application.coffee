define ['marionette'], (Marionette) ->

  App = new Marionette.Application()

  App.addRegions
    # <name>: '<jQuery selector>'

    # e.g.
    # main: '#main'

  App
