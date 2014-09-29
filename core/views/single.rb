class Single < Layout
  def post
    @post.values
  end

  def parse_content(content)
    MDParser.render(content)
  end

  def post_author
    author = @post.author #Author.where(id: @post.author).first
    author.display_name || author.username
  end

  def author
    @author.values
  end
end
