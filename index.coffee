# vair-logger.coffee

winston = require 'winston'
path = require 'path'
moment = require 'moment'
Logger = require './logger'


getLogger = (level, file) ->
	defaultLevel = 'info'
	defaultFile = 
		path: './'
		name: 'server.log'

	logger = new winston.Logger {
		transports: [
			new winston.transports.Console( {
					timestamp: () ->
						return moment().format 'YYYY-MM-DD HH:mm:ss'
				})
		]
	}

	if level?
		defaultLevel = level

	logger.level = defaultLevel

	# if file log needed
	if file?
		if file.name? and file.name != "" 
			defaultFile.name = file.name

		if file.path?
			defaultFile.path = file.path

		filePath = path.resolve defaultFile.path, defaultFile.name
		logger.add require('winston-daily-rotate-file'), {filename: filePath, datePattern: '.yyyy-MM-dd'}


	return logger

module.exports = getLogger, Logger