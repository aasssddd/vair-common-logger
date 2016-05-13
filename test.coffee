# test.coffee
Logger = require './logger'

# use default location config file
logger = Logger.getLogger()

logger.info "this logger will write to console, file and logentries"

# create logger by pass parameters
logger2 = Logger.getLogger {
	file: 
		level: "info",
		name: "logger2.log",
		path: null
	console: 
		level: "info"
}

logger2.info "logger2 will write to console and file"
