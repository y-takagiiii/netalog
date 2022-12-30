require 'rails_helper'

RSpec.describe "Searches", type: :request do
  describe "GET /search" do
    it "returns http success" do
      get "/searches/search"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /result" do
    it "returns http success" do
      get "/searches/result"
      expect(response).to have_http_status(:success)
    end
  end

end
