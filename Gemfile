source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Heroku uses the ruby version to configure your application"s runtime.
ruby "3.1.3"

gem "amazing_print"
gem "bootsnap", require: false
gem "pg"
gem "puma", "~> 5.6" # Rails doesn't yet support puma 6 as of rails 7.0
gem "rack-canonical-host"
gem "rails", "~> 7.0.3"
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
end

group :test do
  gem "capybara"
  # gem "capybara-email"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "simplecov"
  gem "webdrivers"
end
