module PostHelpers
  # Excerpt
  #
  # Creates a post excerpt from full text. Removes 
  # any paragraph/tags that could interfere with front page
  # formatting.
  #
  # @param text [String] - The full text of a post including HTML tags
  # @return [String] - The excerpted text. 220 chars plus whitelisted tags
  def excerpt(text, strip_html=true)
    AutoExcerpt.new(text,  {characters: 220, strip_html: strip_html, allowed_tags: %w(em strong span pre code i)})
  end
end
