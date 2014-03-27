exports.before = (sprout, done) ->
  welcome = """
            \n
            Let's create a new Roots project with Hull integration!\n
            Before continuing, please make sure to visit http://hull.io\n
            and create a new application. Locate the unique Hull app\n
            credentials. We will use these to bootstrap a new app!
            \n
            Let's get started:
            """
  console.log welcome
  done()

exports.configure = [
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
    type: "confirm"
    name: "include_fb"
    message: "Do you want to include the Facebook JS SDK?"
    default: true
  },
  {
    type: 'input'
    name: 'FB_App_Id'
    message: "What is the App ID of your FB App?"
    when: (answers) ->
      if answers.include_fb then true else false
  }

]

exports.after = (sprout, done) ->
  console.log sprout.config_values
  done()
