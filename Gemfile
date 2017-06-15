source "https://rubygems.org"

# Heroku uses the ruby version to configure your application's runtime.
ruby "2.4.1"

gem "listen"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 5.1.1"

gem "autoprefixer-rails"
gem "bootstrap-sass"
gem "coffee-rails"
gem "jquery-rails"
gem "sassc-rails"
gem "simple_form"
gem "slim-rails"
gem "uglifier"

gem "awesome_print"

gem 'webpacker', git: 'https://github.com/rails/webpacker.git'

group :production, :acceptance do
  gem "rack-timeout"
end

group :test do
  gem "capybara"
  # gem 'capybara-email'
  gem "database_cleaner"
  gem "poltergeist"
  gem "simplecov"
end

group :test, :development do
  gem "factory_girl_rails"
  gem "rspec-rails"
  gem "rubocop", require: false
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "foreman"
  gem "launchy"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"
  # gem 'guard'
  # gem 'guard-rspec', '>= 4.6.5'                  # Resolves to 1.x without a version constraint. :/
  # gem 'guard-livereload'
end
