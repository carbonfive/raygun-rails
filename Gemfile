source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Heroku uses the ruby version to configure your application"s runtime.
ruby "2.6.6"

gem "amazing_print"
gem "bootsnap", require: false
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 6.0.2"
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
  gem "rspec-rails"
  gem "rspec_junit_formatter", require: false
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
end

group :development do
  gem "annotate"
  gem "better_errors"
  gem "binding_of_caller"
  gem "dotenv-rails"
  gem "guard", require: false
  gem "guard-rspec", require: false
  gem "launchy"
  gem "listen"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"
end

group :test do
  gem "capybara"
  # gem "capybara-email"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "simplecov"
  gem "webdrivers"
end
