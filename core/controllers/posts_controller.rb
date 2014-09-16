class PostsController < ApplicationController
  get '/new/?' do
    Post.create(title: 'Another post', content: 'This is the content...', slug: 'my-new-post', published_on: Time.now, status: 'published', author_id: 1)
    "We made it!"
  end

  get '/?' do
    "Posts controller."
  end
end
