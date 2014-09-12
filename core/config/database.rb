require 'sequel'

# Load up the database
if ['development', 'test'].include? ENV['RACK_ENV']
  DB = Sequel.sqlite(SndConfig.database['name'])
elsif ENV['RACK_ENV'] == production
  DB = Sequel.connect(adapter: SndConfig.database['adapter'], user: SndConfig.database['user'], host: SndConfig.database['host'], database: SndConfig.database['name'], password: SndConfig.database['password'])
else
  puts "\n--------\nYou somehow have no environment set. You'll probably see a stack trace now...\n--------\n"
end
