class AuthLayout < Mustache
  def page_name
    @page_name
  end

  def ga_site_id
    SndConfig.google_analytics_id
  end
end
