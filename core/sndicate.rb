# TODO: Remove this line require 'sinatra/base'
require 'yaml'
require 'ostruct'

sndicate = {
  env: ENV['RACK_ENV']
}

# Initialize configuration
full_config = YAML.load_file("#{SndRoot}/snd_config.yml") || {}
env_config = full_config[sndicate[:env]] || {}
SndConfig = OpenStruct.new(env_config)

# TODO: Use File.dirname instead of SndRoot
require "#{SndRoot}/core/config/database"
