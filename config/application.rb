require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AppPrototype
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Enable/disable generators.
    config.generators do |g|
      # Core Rails
      # g.orm              :active_record, primary_key_type: :uuid
      g.javascripts      false
      g.stylesheets      false
      g.helper           false

      # Specs
      g.factory_bot      true
      g.routing_specs    false
      g.view_specs       false
      g.controller_specs false
      g.request_specs    false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
  end
end
