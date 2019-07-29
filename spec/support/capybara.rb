require "selenium/webdriver"

Webdrivers.cache_time = 24.hours.seconds

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new app, browser: :chrome
end

Capybara.register_driver :headless_chrome do |app|
  browser_options = ::Selenium::WebDriver::Chrome::Options.new
  browser_options.args << "--headless"
  browser_options.args << "--window-size=1024,3840"

  # Try this if chrome crashes. https://sites.google.com/a/chromium.org/chromedriver/help/chrome-doesn-t-start
  # browser_options.args << "--no-sandbox"

  # This enables access to the JS console logs in your feature specs.
  # You can see the logs during the test by calling (for example):
  #
  #   puts page.driver.browser.manage.logs.get(:browser).map(&:inspect).join("\n")
  #
  # This will print out each log entry in the JS log, including e.g. the React welcome notice.
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    logging_prefs: { "browser" => "ALL" }
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: browser_options,
    desired_capabilities: capabilities
  )
end

chrome_driver = ENV["HEADLESS"] == "false" ? :chrome : :headless_chrome

Capybara.default_driver    = :rack_test
Capybara.javascript_driver = chrome_driver

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by(:rack_test)
  end

  config.before(:each, type: :system, js: true) do
    driven_by(chrome_driver)
  end
end
