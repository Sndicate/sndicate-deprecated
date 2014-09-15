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
    unless @author.nil?
      @author.map do |author|
        {
          bio: author.bio,
          name: preferred_name(author.username, author.display_name)
        }
      end
    end
  end

  def has_categories
    unless @categories.nil?
      true
    end
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
    # Excerpt
    #
    # Creates a post excerpt from full text. Removes 
    # any paragraph/tags that could interfere with front page
    # formatting.
    #
    # @param text [String] - The full text of a post including HTML tags
    # @return [String] - The excerpted text. 220 chars plus whitelisted tags
    def excerpt(text)
      AutoExcerpt.new(text,  {characters: 220, strip_html: true, allowed_tags: %w(em strong span pre code i)})
    end

    # Preferred name
    #
    # Takes two strings and returns the preferred option of the two.
    # In this case we use it for displaying a site owner's username
    # or display name depending on which one exists. If neither exists
    # returns the string 'No one'.
    #
    # @param default [String] - The fallback string to use if preferred is not present
    # @param preferred [String] - The string you actually want returned if exists
    # @return [String] - Whichever string existed or 'No one' if both were empty
    def preferred_name(default, preferred)
      if default.nil? && preferred.nil?
        'No one'
      elsif preferred.nil?
        default
      else
        preferred
      end
    end
end
