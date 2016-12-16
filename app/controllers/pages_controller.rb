class PagesController < ApplicationController

  def root
    @on_heroku = !ENV['DYNO'].nil?
  end

end
