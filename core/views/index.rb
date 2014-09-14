# Index View
#
# This is the blog homepage view. It
# contains methods that output a list
# of posts and other data for the view.
class Index < Layout
  def posts
    unless @posts.nil?
      @posts.map do |post|
        {
          id: post.id,
          title: post.title, 
          content: post.content,
          slug: post.slug, 
          author: post.author_id,
          published_on: post.published_on, 
          last_updated: post.last_updated, 
          excerpt: excerpt(post.content)
        }
      end
    else
      @no_posts = true
    end
  end

  def author
    {
      bio: 'This is some bio text.'
    }
  end

  def has_categories
    true
  end

  def categories
    [{name: 'Sunshine', id: 1}, {name: 'Vacations', id: 2}, {name: 'Unicorns', id: 3}, {name: 'Bullshit', id: 4}]
  end

  def pagination
    {
      prev_page: false,
      next_page: 2
    }
  end

  private
    def excerpt(text)
      AutoExcerpt.new(text,  {characters: 220})
    end
end
