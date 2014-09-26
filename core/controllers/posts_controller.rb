class PostsController < ApplicationController
  # GET /posts/new
  # Show form to create new post
  get '/new/?' do
    Post.create(title: 'Another post', content: 'This is the content...', slug: 'my-new-post', published_on: Time.now, status: 'published', author_id: 1)
    "We made it!"
  end

  # POST /posts/create
  # Publish new post
  post '/create/?' do
    #
  end

  # GET posts/edit/:id
  # Show form to edit a post
  get '/edit/:id' do |post|
    #
  end

  # POST /posts/update/:id
  # Update a post
  post '/update/:id' do |post|
    #
  end

  # POST /posts/delete/:id
  # Deletes an existing post
  post '/delete/:id' do |post|
    #
  end

  # GET /posts/
  # Show all posts
  get '/?' do
    'Posts controller'
  end
end
