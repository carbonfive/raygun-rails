source 'https://rubygems.org'

# Heroku uses the ruby version to configure your application's runtime.
ruby '2.3.1'

gem 'puma'
gem 'rack-canonical-host'
gem 'rails', '~> 5.0'
gem 'listen'
gem 'pg'

gem 'slim-rails'
gem 'sassc-rails'
gem 'bootstrap-sass'
gem 'jquery-rails'
gem 'coffee-rails'
gem 'simple_form'
gem 'uglifier'
gem 'autoprefixer-rails'

gem 'awesome_print'

group :production, :acceptance do
  gem 'rack-timeout'
end

group :test do
  gem 'capybara'
  #gem 'capybara-email'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'simplecov'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :development do
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'spring-commands-rspec'
  gem 'foreman'
  gem 'launchy'
  gem 'better_errors'
  gem 'binding_of_caller'
  # gem 'guard'
  # gem 'guard-rspec', '>= 4.6.5'                  # Resolves to 1.x without a version constraint. :/
  # gem 'guard-livereload'
end
