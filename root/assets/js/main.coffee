cloudflare = '//cdnjs.cloudflare.com/ajax/libs'

require.config

  packages: [{ name: 'when', location: '/js/vendor/when', main: 'when' }]

  shim:
    underscore: { exports: '_' }
    backbone: { deps: ['jquery', 'underscore'], exports: 'Backbone' }
    marionette: { deps: ['backbone'], exports: 'Marionette' }
    routefilter: { deps: ['backbone'] }
    hull: { deps: ['jquery'], exports: 'Hull' }
    templates: { exports: 'templates' }
    facebook: { deps: ['hull'], exports: 'FB' }

  paths:
    jquery: "#{cloudflare}/jquery/2.0.3/jquery.min"
    underscore: "#{cloudflare}/underscore.js/1.6.0/underscore-min"
    backbone: "#{cloudflare}/backbone.js/1.1.2/backbone-min"
    marionette: "#{cloudflare}/backbone.marionette/1.5.1-bundled/backbone.marionette.min"
    hull: '//d3f5pyioow99x0.cloudfront.net/0.8/hull'
    routefilter: '/js/vendor/routefilter'
    facebook: '//connect.facebook.net/en_US/all'

    # application
    app: 'application'

require ['app', 'router', 'controller', 'fb'], (App, Router, Controller) ->
  App.on 'initialize:after', ->
    router = new Router(controller: new Controller)
    App.reqres.setHandler('router', -> router)
    Backbone.history.start(pushState: true)

  App.start()
