cloudflare = '//cdnjs.cloudflare.com/ajax/libs'

require.config

  shim:
    <%if (include_backbone) {%>underscore: { exports: '_' }<%}%>
    <%if (include_backbone) {%>backbone: { deps: ['jquery', 'underscore'], exports: 'Backbone' }}<%}%>
    <%if (include_backbone) {%>marionette: { deps: ['backbone'], exports: 'Marionette' }<%}%>
    <%if (include_backbone) {%>routefilter: { deps: ['backbone'] }}<%}%>
    hull: { deps: ['jquery'], exports: 'Hull' }
    templates: { exports: 'templates' }
    <%if (include_fb) {%>facebook: { deps: ['hull'], exports: 'FB' }<%}%>

  paths:
    jquery: "#{cloudflare}/jquery/2.0.3/jquery.min"
    <%if (include_backbone) {%>underscore: "#{cloudflare}/underscore.js/1.6.0/underscore-min"<%}%>
    <%if (include_backbone) {%>backbone: "#{cloudflare}/backbone.js/1.1.2/backbone-min"<%}%>
    <%if (include_backbone) {%>marionette: "#{cloudflare}/backbone.marionette/1.5.1-bundled/backbone.marionette.min"<%}%>
    hull: '//d3f5pyioow99x0.cloudfront.net/0.8/hull'
    <%if (include_backbone) {%>routefilter: '/js/vendor/routefilter'<%}%>
    <%if (include_fb) {%>facebook: '//connect.facebook.net/en_US/all'<%}%>

    <%if (include_backbone) {%>
    # application
    app: 'application'
    <%}%>

<%if (include_backbone) {%>
  require ['app', 'router', 'controller'<%if (include_fb) {%>, 'fb'<%}%>], (App, Router, Controller) ->
    App.on 'initialize:after', ->
      router = new Router(controller: new Controller)
      App.reqres.setHandler('router', -> router)
      Backbone.history.start(pushState: true)

    App.start()
<%} else {%>
  require ['hull', 'config'], (Hull, config) ->
    Hull.init config.hull, (hull, me, app, org) ->

    Hull.on 'hull.init', (hull, me, app, org) ->
      console.log "Hello from main.coffee! Ready to rock!"
<%}%>
