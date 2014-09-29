# IMPORTANT: Why is this file here? Config.ru seems to be better for this.
# TODO: Remove this line require 'sinatra/base'
require 'bundler'
require 'yaml'
require 'ostruct'
Bundler.require :default, ENV['RACK_ENV'].to_sym
# FIXME: Either fix the errors or remove dependency
# require 'rack/bug/panels/mustache_panel'
# use Rack::Bug::MustachePanel

config_file = (ENV['RACK_ENV'] == 'test') ? 'snd_config.sample.yml' : 'snd_config.yml'

# Load configuration from file
full_config = YAML.load_file("./#{config_file}") || {}
env_config  = full_config[ENV['RACK_ENV']] || {}
SndConfig   = OpenStruct.new(env_config)

MDParser = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true, no_intra_emphasis: true, fenced_code_blocks: true, disable_indented_code_blocks: true)

require "#{SndRoot}/core/config/database"
