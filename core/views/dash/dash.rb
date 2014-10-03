class Dash < DashLayout
  include PostHelpers

  # Recent posts
  #
  # Lists recent posts
  def posts
    @posts.map do |post|
      {
        id: post.id,
        title: post.title,
        content: post.content,
        excerpt: excerpt(post.content),
        published_on: post.published_on,
        last_updated: post.last_updated,
        slug: post.slug,
        author_id: post.author_id
      }
    end
  end
end
