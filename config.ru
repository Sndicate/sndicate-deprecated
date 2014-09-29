# This file gets our app running on Rack. You shouldn't need to edit it.
ENV['RACK_ENV'] ||= 'development'

# SndRoot references the root path to your Sndicate
# installation. It is available globally throughout the app.
SndRoot = File.dirname(__FILE__)

# This bootstraps the application and loads the core files
require './core/sndicate'
Dir.glob('./core/{models,lib}/*.rb') { |file| require file }

# Everything below this line tells Rack how to route requests.
# The general pattern is `controller_name/action/params` where
# some magic removes the '_controller.rb' portion of controller
# file names. Application controller catches all other routes.
Dir.glob('./core/controllers/*.rb').each do |file|
  require file
  controller_name = File.basename(file).partition('_')[0]
  map("/#{controller_name}") { run eval("#{controller_name.capitalize}Controller") } unless controller_name == 'application'
end

map("/#{SndConfig.posts_prefix}") { run PostsController }
map('/') { run ApplicationController }
