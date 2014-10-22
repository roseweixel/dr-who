require 'ostruct'
DBRegistry ||= OpenStruct.new(test: ConnectionAdapter.new("db/dr_who-test.db"), 
  development: ConnectionAdapter.new("db/dr_who-development.db"), 
  production: ConnectionAdapter.new("db/dr_who-production.db")
  )
