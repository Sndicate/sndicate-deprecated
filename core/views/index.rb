# /core/views/index.rb
# Methods to populate default index page templates.
class Index < Layout
  def posts
    unless @posts.empty?
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
    end
  end

  def author
    unless @author.empty?
      @author.map do |author|
        {
          bio: author.bio,
          name: preferred_name(author.username, author.display_name)
        }
      end
    end
  end

  # Has categories?
  #
  # Checks to see if any categories exist in our database. 
  # If the @categories object is empty return false, else
  # return true.
  def has_categories
    @categories.empty? ? false : true
  end

  def categories
    @categories.map { |category| { id: category.id, name: category.name } }
  end

  # TODO: Implement pagination
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
