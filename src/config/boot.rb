$LOAD_PATH.unshift << 'lib'
STDOUT.sync = true

# Defines our constants
APP_ENV = ENV['RACK_ENV'] ||= 'development' unless defined?(APP_ENV)
APP_ROOT = File.expand_path('../..', __FILE__) unless defined?(APP_ROOT)

# Load our dependencies
require 'bundler/setup'
Bundler.require(:default, APP_ENV)

require '!{projectnamelower}'
require !{project_name_camel}.root('config', 'database')
require !{project_name_camel}.root('app', 'app')

Dir[!{project_name_camel}.root('app', 'controllers', '**/*.rb')].each {|f| require f}
