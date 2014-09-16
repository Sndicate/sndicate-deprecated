class AuthorsController < ApplicationController
  # GET /authors/new
  # Show the signup form
  get '/new/?' do
    # password = BCrypt::Password.create('secretssss!')
    Author.create(display_name: 'Bill', username: 'bill', email: 'bill@localhost', password: BCrypt::Password.create('secretssss!'), bio: 'I am a person.', role: 'owner')
    "New user made"
  end

  # POST /authors/create
  # Creates a new author
  post '/create/?' do
    #
  end

  # GET /authors/edit
  # Show the edit form
  get '/edit/:id' do |author|
    #
  end

  # POST authors/update
  # Update author information
  post '/update/:id' do |author|
    #
  end

  # POST /authors/delete/:id
  # Delete an author
  post '/delete/:id' do |author|
    #
  end

  # GET /authors
  # Show a list of authors
  get '/?' do
    "Authors controller here."
  end
end
