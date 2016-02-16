# test.coffee
getLogger = require './index'

logger = getLogger 'debug'
file_logger = getLogger 'debug', { name: 'test.log'}

logger.debug 'this log should not show'
file_logger.debug 'this log should not show in file'

logger.info 'this is info log'
file_logger.info 'this is info log of file'