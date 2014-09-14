# This file gets our app running on Rack.
ENV['RACK_ENV'] ||= 'development'
SndRoot = File.dirname(__FILE__)

# This bootstraps the application
require './core/sndicate'

##
# Everything below this line tells Rack how to route requests.
#
Dir.glob('./core/{models,lib}/*.rb') { |file| require file }

Dir.glob('./core/controllers/*.rb').each do |file|
  require file
  controller_name = File.basename(file).partition('_')[0]
  map("/#{controller_name}") { run eval("#{controller_name.capitalize}Controller") } unless controller_name == 'application'
end

# Map all other routes to app controller
map('/') { run ApplicationController }
