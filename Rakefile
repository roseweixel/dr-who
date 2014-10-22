require 'active_record_migrations'

ActiveRecordMigrations.configure do |c|
  c.database_configuration = {
    'development' => {'adapter' => 'sqlite3', 'database' => 'db/custom.sqlite3'},
  }
  # Other settings:
  c.schema_format = :sql # default is :ruby
  # c.yaml_config = 'db/config.yml'
  # c.environment = ENV['db']
  # c.db_dir = 'db'
  # c.migrations_paths = ['db/migrate'] # the first entry will be used by the generator
end

ActiveRecordMigrations.load_tasks

task :environment do
  ENV["DR_WHO_ENV"] ||= "development"
  require_relative 'config/environment'
  # require 'logger'
  # ActiveRecord::Base.logger = Logger.new(STDOUT)
end

# namespace :db do
#   task :migrate => :environment do
#     DB.tables.each do |table|
#       DB.execute("DROP TABLE #{table}")
#     end

#     Dir[File.join(File.dirname(__FILE__), "db/migrate", "*.rb")].each do |f| 
#       require f
#       migration = Kernel.const_get(f.split("/").last.split(".rb").first.gsub(/\d+/, "").split("_").collect{|w| w.strip.capitalize}.join())
#       migration.migrate(:up)
#     end
#   end
# end
require 'pry'
task :console => :environment do
  Pry.start
end