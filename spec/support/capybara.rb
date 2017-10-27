require "selenium/webdriver"

Capybara.register_driver :headless_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--headless")

  # Try this if chrome crashes.
  # https://sites.google.com/a/chromium.org/chromedriver/help/chrome-doesn-t-start
  # options.add_argument("--no-sandbox")

  options.add_argument("--window-size=1280,1024")
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver    = :rack_test
Capybara.javascript_driver = :headless_chrome
