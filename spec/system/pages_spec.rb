require "rails_helper"

describe "Static Pages" do
  # Here's a placeholder feature spec to use as an example, uses the default driver.
  it "/ should include the application name in its title" do
    visit root_path

    expect(page).to have_title "App Prototype"
  end

  # Another contrived example, this one relies on the javascript driver.
  it "/ should include a button with the CTA message 'And away we go!'", js: true do
    visit root_path

    expect(page).to have_css("button", text: "And away we go!")
  end
end
