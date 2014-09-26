class DashController < ApplicationController
  # GET /dash
  # Show the main dashboard page
  # or redirect to login.
  get '/?' do
    logger.warn "This is the main dash page"
  end

  # POST /dash/authenticate
  # Log into Sndicate
  post '/authenticate/?' do
    #
  end

  # GET /dash/register
  # Show the signup page
  get '/register/?' do
    mustache :register
  end
end
