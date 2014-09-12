# Default theme layout
#
# All layouts inherit from Mustache
# while individual views will inherit
# from the layout they should use.
class Layout < Mustache
  def site_title
    'Site Title'
  end

  def page_title
    @title || 'Default page title'
  end

  def page_description
    'Default page description'
  end

  def author
    if @post
      @post.author || SndConfig.default_author_name
    else
      SndConfig.default_author_name
    end
  end

  def has_pages
    true
  end

  def pages
    [
    {
      title: 'Page One',
      slug: 'page-one'
    },
    {
      title: 'Another Page',
      slug: 'another-page'
    }
  ]
  end

  def copyright
    # TODO: Check for 'site.date_created' and use
    # it to generate a copyright range or single year
    '2014'
  end

  def ga_site_id
    SndConfig.google_analytics_id
  end
end
