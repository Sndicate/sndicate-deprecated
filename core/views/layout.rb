# Default theme layout
#
# All layouts inherit from Mustache
# while individual views will inherit
# from the layout they should use.
class Layout < Mustache
  def site_title
    SndConfig.site_title
  end

  def page_title
    @title ||= "#{SndConfig.site_title} | #{SndConfig.site_summary}"
  end

  def page_description
    @description ||= SndConfig.site_description
  end

  def author
    @post.author || SndConfig.default_author_name
  end

  def has_pages
    true
  end

  def pages
    @pages.map { |page| { title: page.title, slug: page.slug } }
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
