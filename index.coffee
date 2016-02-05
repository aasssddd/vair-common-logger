# vair-logger.coffee

Log = require 'log'
fs = require 'fs'
path = require 'path'


getLogger = (level, file) ->
	defaultLevel = 'info'
	defaultFile = 
		path: './'
		name: 'server.log'

	if level?
		defaultLevel = level

	if file?
		if file.name? and file.name != "" 
			defaultFile.name = file.name

		if file.path?
			defaultFile.path = path

		filePath = path.resolve defaultFile.path, defaultFile.name
		return new Log(level, fs.createWriteStream filePath)
	return new Log(level)

module.exports = getLogger