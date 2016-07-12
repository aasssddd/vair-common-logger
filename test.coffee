# test.coffee
Logger = require './logger'

# use default location config file
logger = Logger.getLogger()

logger.info "this logger will write to console, file and logentries"
logger.warn "test warn"
logger.error "test error"
