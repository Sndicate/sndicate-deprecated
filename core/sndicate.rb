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

require "#{SndRoot}/core/config/database"
