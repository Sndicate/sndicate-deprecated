source 'https://rubygems.org'

# Sinatra is the heart of Sndicate
# We include sinatra-contrib for help with serving JSON, dealing with
# Cookies and to have some more options available just in case.
gem 'sinatra', '~> 1.4.5', require: 'sinatra/base'
gem 'sinatra-contrib', '~> 1.4.2'
gem 'sinatra-flash', '~> 0.3.0', require: 'sinatra/flash'

# JSON gem makes Sinatra::JSON serve better JSON
gem 'json', '~> 1.8.1'

# Database gems. We use Sequel as the ORM, Sqlite as a dev database
# and MySQL (mysql2 gem) in production.
gem 'data_mapper', '~> 1.2.0' # TODO: Remove this line. Deprecated.
gem 'sequel', '~> 4.13.0'
gem 'mysql2', '~> 0.3.16'
gem 'sqlite3', '~> 1.3.9'

# We can require Active Support methods for help with strings, etc.
gem 'activesupport', '~> 4.1.5'

# Auto Excerpt intelligently creates posts excerpts avoiding common issues
gem 'auto_excerpt', '~> 0.7.1'

# All passwords are hashed with Bcrypt
gem 'bcrypt', '~> 3.1.7'

# For session security
gem 'rack_csrf', '~> 2.5.0', require: 'rack/csrf'

# We use Mustache templates for most views
gem 'mustache', '~> 0.99.6'

# Gems used in development only
group :development do
  gem 'thin', '~> 1.6.2'
  gem 'rerun', '~> 0.10.0'
  gem 'yard', '~> 0.8.7.4'
  gem 'colorize', '~> 0.7.3'
  gem 'rack-bug', '~> 0.3.0', require: 'rack/bug'
end

# Production-only gems
group :production do
  gem 'puma', '~> 2.9.0'
end

# Gems for testing
group :test do
  gem 'rake'
  gem 'rspec', '~> 3.1.0'
  gem 'rspec-nc', '~> 0.2.0'
  gem 'guard', '~> 2.6.1'
  gem 'guard-rspec', '~> 4.3.1'
  gem 'rack-test', '~> 0.6.2'
end
