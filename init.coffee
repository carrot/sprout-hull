# A module specific to cleaning out
# the files/folders of this project

cleaner = (sprout) ->
  values = sprout.config_values

  backbone = {
    files: ['assets/js/application.coffee', 'assets/js/controller.coffee', 'assets/js/router.coffee', 'assets/js/vendor/routefilter.js', 'assets/js/models/user.coffee']
  }

  fb = {
    files: ['assets/js/fb.coffee']
  }

  social = {
    files: ['views/_social_logins.jade']
  }

  clean_dependencies = (branch, condition) ->
    unless condition
      for type, path of branch
        for file in branch[type]
          console.log "removing #{file}..."
          sprout.remove file

  clean_backbone = -> clean_dependencies(backbone, values.include_backbone)
  clean_facebook = -> clean_dependencies(fb, values.include_fb)
  clean_social = -> clean_dependencies(social, values.platforms.length)

  return {
    cleanup: ->
      clean_backbone()
      clean_facebook()
      clean_social()
  }

exports.before = (sprout, done) ->
  welcome = """

            Let's create a new Roots project with Hull integration!
            Before continuing, please make sure you have created a
            new Hull application at http://hull.io. You will be given
            certain credentials specific to your Hull app; locate them
            as we will use these to bootstrap a new Roots project!

            Let's get started:
            """
  console.log welcome
  done()

exports.configure = [
  {
    type: 'input'
    name: 'title'
    message: 'What is the title of your project?'
    validate: (value) ->
      if typeof value is "string" && value.length > 4
        true
      else
        "Please enter a value of 5 characters or greater"

  },
  {
    type: 'input'
    name: 'Hull_App_Id'
    message: 'Enter your Hull App Id'
  },
  {
    type: 'input'
    name: 'Hull_Org_Url'
    message: 'Enter your Hull Organization Url'
  },
  {
    type: 'checkbox'
    name: 'platforms'
    message: 'Please choose any/all authentication providers you\'d like to include in your project'
    choices: [
      { name: 'Facebook' },
      { name: 'GitHub' },
      { name: 'Twitter' }
    ]
  },
  {
    type: "confirm"
    name: "include_fb"
    message: "Do you want to include the Facebook JS SDK?"
    default: false
  },
  {
    type: 'input'
    name: 'FB_App_Id'
    message: "What is the App ID of your FB App?"
    when: (answers) -> if answers.include_fb then true else false
  },
  {
    type: "confirm"
    name: "include_backbone"
    message: "Do you want to bootstrap this project with Backbone/Marionette?"
    default: false
  }
]

exports.after = (sprout, done) ->
  cleaner(sprout).cleanup()
  done()
