program = require('commander')
packageJSON = require('../package.json')
data = require('./data/data')
config = require('./config')

auth = require('./actions/auth')
app = require('./actions/app')

program.version(packageJSON.version)

# ---------- Auth Module ----------

program
	.command('login <username:password>')
	.description('Login with your resin.io account')
	.action(auth.login)

program
	.command('signup')
	.description('Open signup form')
	.action(auth.signup)

# ---------- App Module ----------

program
	.command('apps')
	.description('Show a list of your apps')
	.action(app.list)

# TODO: Check if not running on UNIX environment
# and add a custom path accordingly
data.prefix.set config.dataPrefix, (error) ->
	throw error if error?
	program.parse(process.argv)
