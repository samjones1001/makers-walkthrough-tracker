require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'lib/cohort'
require_relative 'lib/student'
require_relative 'lib/challenge'
require_relative 'lib/stage'
require_relative 'lib/result'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/walkthrough_tracker_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
