require 'bundler/setup'
Bundler.require

require 'active_record'
require 'rake'
require 'open-uri'

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/support", "*.rb")].each {|f| require f}

DBRegistry[ENV["DR_WHO_ENV"]].connect!
DB = ActiveRecord::Base.connection

if ENV["DR_WHO_ENV"] == "test"
  ActiveRecord::Migration.verbose = false
end