require "selenium/webdriver"

Capybara.register_driver :headless_chrome do |app|
  options = { "args" => %w[headless window-size=1024,3840] }

  # Try this if chrome crashes. https://sites.google.com/a/chromium.org/chromedriver/help/chrome-doesn-t-start
  # options["args"] << "no-sandbox"

  # This enables access to the JS console logs in your feature specs.
  # You can see the logs during the test by calling (for example):
  #
  #   puts page.driver.browser.manage.logs.get(:browser).map(&:inspect).join("\n")
  #
  # This will print out each log entry in the JS log, including e.g. the React welcome notice.
  logging_prefs = { "browser" => "ALL" }

  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chrome_options: options,
    logging_prefs: logging_prefs
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities
  )
end

Capybara.default_driver    = :rack_test
Capybara.javascript_driver = :headless_chrome

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by(:rack_test)
  end

  config.before(:each, type: :system, js: true) do
    driven_by(:headless_chrome)
  end
end
