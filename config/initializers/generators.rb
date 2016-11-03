Rails.application.config.generators do |g|
  # Core Rails
  # g.orm              :active_record, primary_key_type: :uuid
  g.javascripts      false
  g.stylesheets      false
  g.helper           false

  # Specs
  g.factory_girl     true
  g.routing_specs    false
  g.view_specs       false
  g.controller_specs false
  g.request_specs    false
end
