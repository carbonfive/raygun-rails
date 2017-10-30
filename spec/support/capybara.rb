require "selenium/webdriver"

Capybara.register_driver :headless_chrome do |app|
  options = { "args" => %w[headless window-size=1024,3840] }

  # Try this if chrome crashes.
  # https://sites.google.com/a/chromium.org/chromedriver/help/chrome-doesn-t-start
  # options["args"] << "no-sandbox"

  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chrome_options: options,
    logging_prefs: { "browser" => "ALL" }
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities
  )
end

Capybara.default_driver    = :rack_test
Capybara.javascript_driver = :headless_chrome
