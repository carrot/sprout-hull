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
  }
]

exports.after = (sprout, done) ->
  console.log sprout.config_values
  done()
