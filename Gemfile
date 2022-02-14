source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Heroku uses the ruby version to configure your application"s runtime.
ruby "3.1.0"

gem "amazing_print"
gem "bootsnap", require: false
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 6.1"
gem "simple_form"
gem "slim-rails"
gem "webpacker"
# gem "webpacker-react"

# Env specific dependencies...
group :production do
  gem "rack-timeout"
end

group :development, :test do
  gem "byebug"
  gem "factory_bot_rails"
  gem "rspec_junit_formatter", require: false
  gem "rspec-rails"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  gem "annotate"
  gem "better_errors"
  gem "binding_of_caller"
  gem "dotenv-rails"
  gem "launchy"
  gem "listen"
end

group :test do
  gem "capybara"
  # gem "capybara-email"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "simplecov"
  gem "webdrivers"
end
