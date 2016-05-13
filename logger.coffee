# index_new.coffee
winston = require 'winston'
Logentries = require 'winston-logentries'
moment = require 'moment'
fs = require 'fs'
path = require 'path'

class Logger 
	###
		1. if opts not provided, load vairlog.config from project folder 
		2. if opts is a string, load config from input file location
		3. if opts is an object, 
		opts: {
			file: { level: "info", name: "somefile.name", path: "somefile.path"},
			console: {
				level: "info"
			},
			logentries: {
				level: "info"
				token: xxxooo
			}
		}
	###
	@getLogger: (opts) ->
		option =
			file: 
				level: "info"
				name: null
				path: "./"
			console: 
				level: "info"
			logentries:
				level: "info"
				token: null

		opt = null
		if not opts?
			stat = fs.statSync path.resolve "./log_config.coffee"
			if stat.isFile()
				opt = require './log_config'
			else
				opt = option
		else if opts is 'string'
			opt = require "#{path.resolve opts}"
		else 
			opt = opts

		appender = []

		appender.push new winston.transports.Console {
			name: "testlogger-console",
			level: "#{if opt.console? and opt.console.level? then opt.console.level else option.console.level}"
		}

		if opt.logentries? and opt.logentries.token?
			appender.push new winston.transports.Logentries {
				name: "testlogger-logentries",
				token: opt.logentries.token,
				level: "#{if opt.logentries.level? then opt.logentries.level else option.logentries.level}"
			}

		logger = new winston.Logger { transports: appender }

		if opt.file? and opt.file.name?
			if not opt.file.path?
				opt.file.path = option.file.path
			
			logger.add require('winston-daily-rotate-file'), {
				name: "testlogger-file",
				filename: "#{path.resolve opt.file.path, opt.file.name}",
				level: "#{if opt.file.level? then opt.file.level else option.file.level}",
				datePattern: ".yyyy-MM-dd"
			}


		return logger

module.exports = Logger