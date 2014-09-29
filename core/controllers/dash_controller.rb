class DashController < ApplicationController
  configure do
    set :mustache, { views: "#{SndRoot}/core/views/dash", templates: "#{SndRoot}/core/views/dash" }
  end

  before do
    @csrf_tag = Rack::Csrf.tag(request.env)
  end

  before '/?' do
    redirect '/dash/login' unless session[:user]
  end

  ['/login/?', '/register/?'].each do |route|
    before route do
      redirect '/dash' if session[:user]
    end
  end

  # GET /dash
  # Show the main dashboard page
  # or redirect to login.
  get '/?' do
    mustache :dash, layout: :dash_layout
  end

  # GET /dash/login
  # Show the login page
  get '/login/?' do
    @page_name = 'Log in | '
    mustache :login, layout: :auth_layout
  end

  # POST /dash/authenticate
  # Log into Sndicate
  post '/authenticate/?' do
    user = Author.where(username: params[:username]).first

    if !user.nil? && user.password == BCrypt::Password.new(user.password)
      session[:user] = user
      redirect '/dash'
    else
      flash[:notice] = 'Invalid username or password'
      redirect '/dash/login'
    end
  end

  # GET /dash/register
  # Show the signup page
  get '/register/?' do
    @page_name = 'Register | '
    mustache :register, layout: :auth_layout
  end

  # GET /dash/logout
  # Log out
  get '/logout' do
    session[:user] = nil
    redirect '/'
  end
end
