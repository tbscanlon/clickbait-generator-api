if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'csv'
require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end

  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end

  desc "Populate Prefix table"
  task :populate_prefix do
    CSV.foreach("app/public/csv/prefixes.csv") do |item|
      Prefix.create(content: item.join)
      puts "Added #{item} to table"
    end
  end

  desc "Populate Suffix table"
  task :populate_suffix do
    CSV.foreach("app/public/csv/suffixes.csv") do |item|
      Suffix.create(content: item.join)
      puts "Added #{item} to table"
    end
  end
end
