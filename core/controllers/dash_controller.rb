class DashController < ApplicationController
  configure do
    set :mustache, { views: "#{SndRoot}/core/views/dash", templates: "#{SndRoot}/core/views/dash" }
  end

  before do
    @csrf_tag = Rack::Csrf.tag(request.env)
    redirect '/dash/login' unless (session[:user] || ['/login', '/register'].include?(request.path_info))
  end

  # GET /dash
  # Show the main dashboard page
  # or redirect to login.
  get '/?' do
    @posts = Post.limit(15).all
    mustache :dash, layout: :dash_layout
  end

  # GET /dash/login
  # Show the login page
  get '/login/?' do
    redirect '/dash' if session[:user]
    @page_name = 'Log in | '
    mustache :login, layout: :auth_layout, locals: { notice: flash[:notice] }
  end

  # POST /dash/authenticate
  # Log into Sndicate
  post '/login/?' do
    user = Author.where(username: params[:username]).first

    if !user.nil? && BCrypt::Password.new(user.password) == params[:password]
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
    redirect '/dash' if session[:user]
    @page_name = 'Register | '
    mustache :register, layout: :auth_layout
  end

  # GET /dash/logout
  # Log out
  get '/logout' do
    session[:user] = nil
    redirect '/'
  end

  # Admin resource routes
  #
  # These routes load the views that allow
  # admins to interact with different resources
  # like posts, authors, pages, etc.
  get '/posts/new/?' do
    #
  end

  get '/posts/edit/?' do
    #
  end

  get '/posts/?' do
    params[:page] ||= 25

    @posts = Post.limit(params[:page]).all
    mustache :post_index, layout: :post_layout
  end
end
