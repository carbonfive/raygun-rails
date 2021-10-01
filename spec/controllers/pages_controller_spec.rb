require "rails_helper"

RSpec.describe PagesController do
  describe "GET 'root'" do
    subject(:execute_request) { get "root" }

    it "returns http success" do
      execute_request
      expect(response).to be_successful
    end

    it "sends the cache-control header to disable browser caches" do
      execute_request
      expect(response.headers["Cache-Control"]).to eq("no-store")
    end
  end
end
