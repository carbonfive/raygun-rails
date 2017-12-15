source "https://rubygems.org"

# Heroku uses the ruby version to configure your application"s runtime.
ruby "2.4.3"

gem "listen"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 5.1.4"

gem "autoprefixer-rails"
gem "bootstrap-sass"
gem "coffee-rails"
gem "jquery-rails"
gem "sass-rails", require: false # Needed for generator (e.g. rail g controller Users)
gem "sassc-rails"
gem "simple_form"
gem "slim-rails"
gem "uglifier"

gem "awesome_print"

group :production, :acceptance do
  gem "rack-timeout"
end

group :test do
  gem "capybara"
  # gem "capybara-email"
  gem "capybara-selenium"
  gem "simplecov"
end

group :test, :development do
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "rspec_junit_formatter"
  gem "rubocop", require: false
end

group :development do
  gem "annotate"
  gem "better_errors"
  gem "binding_of_caller"
  gem "dotenv-rails"
  gem "launchy"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"
  # gem "guard"
  # gem "guard-rspec", ">= 4.6.5" # Resolves to 1.x without a version constraint. :/
  # gem "guard-livereload"
end
