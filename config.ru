# Rackup file
#
# We load our environment and dependencies and start
# the application here.
ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

# require 'bundler'
# Bundler.require

# TODO: Look into the following way of setting up requires
# require 'bundler/setup'
# Bundler.require(:environment_name)

SndRoot = File.dirname(__FILE__) # TODO: Look into using File.expand_path instead
require './core/sndicate'

# # Load up the database
# if ['development', 'test'].include? ENV['RACK_ENV']
#   DB = Sequel.sqlite(SndConfig.database['name'])
# else
#   # DB = Sequel.sqlite(SndConfig.database['name'])
#   # FIXME: Production database needs setting up
#   puts "We need to set up a production ready database"
# end

Dir.glob('./core/{models,lib}/*.rb') { |file| require file }

Dir.glob('./core/controllers/*.rb').each do |file|
  require file
  controller_name = File.basename(file).partition('_')[0]
  map("/#{controller_name}") { run eval("#{controller_name.capitalize}Controller") } unless controller_name == 'application'
end

# Map all other routes to app controller
map('/') { run ApplicationController }
