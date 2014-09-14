class AuthorsController < ApplicationController
  get '/' do
    "U controller"
  end

  get '/new/?' do
    # password = BCrypt::Password.create('secretssss!')
    Author.create(display_name: 'Bill', username: 'bill', email: 'bill@localhost', password: BCrypt::Password.create('secretssss!'), bio: 'I am a person.')
    "New user made"
  end
end
