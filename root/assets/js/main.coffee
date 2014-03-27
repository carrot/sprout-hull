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
    <%if (include_backbone) {%>routefilter: '/js/vendor/routefilter'<%}>
    <%if (include_fb) {%>facebook: '//connect.facebook.net/en_US/all'<%}%>

    <%if (include_backbone) {%>
    # application
    app: 'application'
    <%}%>

require [<%if (include_backbone) {%>'app', 'router', 'controller'<%}%><%if (include_fb) {%>, 'fb'<%}%>], (<%if (include_backbone) {%>App, Router, Controller<%}%>) ->
  <%if (include_backbone) {%>
  App.on 'initialize:after', ->
    router = new Router(controller: new Controller)
    App.reqres.setHandler('router', -> router)
    Backbone.history.start(pushState: true)

  App.start()
  <%} else {%>
  console.log "hello from main.coffee!"
  <%}%>
