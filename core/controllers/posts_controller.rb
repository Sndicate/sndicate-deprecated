class PostsController < ApplicationController
  get '/' do
    "P Controller"
  end

  get '/new' do
    Post.create(title: 'My first post', content: 'This is the content...', slug: 'my-first-post', published_on: Time.now)
    "We made it!"
  end
end
