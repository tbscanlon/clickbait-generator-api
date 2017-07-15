require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/prefix'
require_relative 'models/suffix'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/clickbait_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
