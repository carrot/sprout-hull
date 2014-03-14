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
  console.log  welcome
  done()

exports.configure = [
  'Hull_App_Id',
  'Hull_Org_Url'
]

###
More config

Ask for platforms (Facebook, Twitter, etc.)
  - Configuration options for services?

Ask to include Facebook SDK?
  - Ask for Facebook App credentials
###

exports.after = (sprout, done) ->
  done()
