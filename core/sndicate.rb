# IMPORTANT: Why is this file here? Config.ru seems to be better for this.
# TODO: Remove this line require 'sinatra/base'
require 'bundler'
require 'yaml'
require 'ostruct'
Bundler.require :default, ENV['RACK_ENV'].to_sym
# FIXME: Either fix the errors or remove dependency
# require 'rack/bug/panels/mustache_panel'
# use Rack::Bug::MustachePanel

# Load configuration from file
full_config = YAML.load_file("./snd_config.yml") || {}
env_config  = full_config[ENV['RACK_ENV']] || {}
SndConfig   = OpenStruct.new(env_config)

require "#{SndRoot}/core/config/database"
