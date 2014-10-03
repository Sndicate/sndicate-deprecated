class ApplicationController < Sinatra::Base
  require './core/views/layout' # Loads the default layout
  
  register Sinatra::Flash, Mustache::Sinatra

  enable :sessions, :logging
  use Rack::Csrf, raise: true

  set public_folder: "#{SndRoot}/public", views: "#{SndRoot}/core/views"
  set :mustache, {
    views: "#{SndRoot}/core/views",
    templates: "#{SndRoot}/core/views"
  }

  helpers Sinatra::JSON, Sinatra::Cookies

  before '/snd-setup/?' do
    halt 401, redirect('/error/401.html') if Author.count > 0
    session[:setup] = true
  end

  before '*' do
    @pages = Page.all
  end

  # GET /snd-setup
  # Display form to register site owner
  get '/snd-setup/?' do
    mustache :setup, layout: :setup_layout
  end
  
  get '/' do
    # TODO: Find a way to return all repeated queries at once (before filter?)
    # NOTE: This can be solved with a filter OR a private method - depends on how many routes use it
    @posts = Post.all # TODO: Limit and paginate
    @author = Author.where(role: 'owner').first
    @categories = Category.all # TODO: Does this need a limit?
    @pages = Page.all
    mustache :index
  end

  # TODO: Think about whether this is the best way to handle 404s
  not_found do
    redirect '/error/404.html'
  end
end
