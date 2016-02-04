# vair-logger.coffee

Log = require 'log'
fs = require 'fs'
path = require 'path'

module.exports.getLogger = (level = "info", file = {path: "./", name: ""}) ->
	if file.name != ""
		filePath = path.resolve file.path, file.name
		return new Log(level, fs.createWriteStream filePath)
	return new Log(level)