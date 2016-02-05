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

	if file.name? 
		defaultFile.name = file.name

	if file.path?
		defaultFile.path = path


	if file.name != ""
		filePath = path.resolve file.path, file.name
		return new Log(level, fs.createWriteStream filePath)
	return new Log(level)

module.exports = getLogger