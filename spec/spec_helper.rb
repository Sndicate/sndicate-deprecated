require 'rack/test'
#require 'sinatra/base'

ENV['RACK_ENV'] ||= 'test'
SndRoot = File.expand_path('../..', __FILE__)

require File.expand_path('../../core/sndicate.rb', __FILE__)
Dir.glob('./core/{models,lib}/*.rb') { |file| require file }

# module RSpecMixin
#   include Rack::Test::Methods
#   def app() described_class end
# end

RSpec.configure do |config|
  include Rack::Test::Methods
  #config.app = described_class
  def app() described_class end
end
