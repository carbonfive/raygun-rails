class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_action :cache_control_no_store_by_default

  private

  def cache_control_no_store_by_default
    response.cache_control[:no_store] = true if response.cache_control.empty?
  end
end
