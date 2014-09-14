require 'bcrypt' # TODO: Does this line need to be here since we use Bundler.require?
require 'sinatra/json'
require 'sinatra/cookies'
require 'mustache/sinatra'
# require 'sinatra/base'
# require 'sinatra/auth'
# require 'sinatra/contact'
# require 'sinatra/flash'
# require 'asset-handler'

class ApplicationController < Sinatra::Base
  register Mustache::Sinatra
  require './core/views/layout' # Loads the default layout

  enable :sessions, :logging

  set :public_folder, "#{SndRoot}/public"
  set :views, "#{SndRoot}/core/views"

  # Mustache templates setup
  set :mustache, {
    views: "#{SndRoot}/core/views",
    templates: "#{SndRoot}/core/views"
  }

  helpers Sinatra::JSON, Sinatra::Cookies

  # GET /snd-setup
  #
  # Registers first user. Only
  # available if no authors exist.
  get '/snd-setup/?' do
    if Author.count > 1
      "Nope. We already have authors here."
    elsif Author.count < 1
      #"We can now setup"
      mustache :setup, layout: :setup_layout
    else
      "Somehow we ended up in a weird place..."
    end
  end

  get '/*/?' do |s|
    pass unless ['hi', 'something', 'whatever'].include? s
    "Lookup worked! (Your string is '#{s}')"
    #mustache :index, layout: :layout
  end
  
  get '/' do
    @posts = Post.all
    mustache :index, posts: @posts
  end

  # TODO: Implement not_found
  # not_found do
  #   "Raise exception or show 404 page here"
  # end
end
