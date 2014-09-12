class Layout < Mustache
  def title
    @title || "This is the default title"
  end
end