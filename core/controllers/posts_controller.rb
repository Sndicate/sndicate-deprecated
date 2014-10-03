class PostsController < ApplicationController
  # GET /posts/
  # Display single post page
  get '/:slug/?' do |slug|
    @post = Post.where(slug: slug).first

    unless @post.nil?
      @author = Author.where(role: 'owner').first
      mustache :single
    end
  end
  
  # POST /posts/create
  # Publish new post
  post '/?' do
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
end
