define ['config', 'facebook'], (config) ->

  window.fbAsyncInit = ->
    FB.init
      appId: config.fb.app_id
      status: true
      xfbml: false
