class PostLayout < Mustache
  def page_name
    'Posts'
  end

  def csrf_tag
    @csrf_tag || "Whatever"
  end

  def whatever
    @whatever || 'Not the thing that is supposed to be here'
  end
end
