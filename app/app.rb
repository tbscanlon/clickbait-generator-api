ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/partial'
require 'json'

require_relative 'dm_setup'

require_relative 'server'
require_relative 'controllers/api'
require_relative "controllers/index"

require_relative 'models/listicle'
