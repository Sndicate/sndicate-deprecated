# Snd-analytics
#
# Rack middleware for injecting
# Google Analytics script into page.
class SndAnalytics
  def initialize(app)
    @ga_script = 'FAKED OUT G-A SCRIPT HERE'
    @app = app
  end

  # TODO: Only run when returning an HTML/XHTML response
  # TODO: Pass in GA site ID
  # TODO: Factor out into a gem
  def call(env)
    puts @ga_script

    status, headers, response = @app.call(env)

    response_body = ""
    response.each { |part| response_body += part }
    response_body += @ga_script

    headers["Content-Length"] = response_body.length.to_s

    [status, headers, [response_body]]
  end
end
