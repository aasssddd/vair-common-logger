# VAIR LOGGER

## Description
Common library for log

## Install
    npm install git+ssh://git@bitbucket.org:vair/vair_log.git

## Usage
    Logger = require 'Logger'
    log = Logger.getLogger 'info'
    log.info 'aaaaa'    # this will print aaaaa
    log.debug 'bbbb'    # this message will not print
    
    log2 = Logger.getLogger 'info', file: {path: './', name: 'file_log.log'}
    log.info 'aaaa' # this will write aaaa to file_log.log 

