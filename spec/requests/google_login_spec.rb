require 'rails_helper'

RSpec.describe "GoogleLogins", type: :request do
  describe "GET /oauth" do
    it "returns http success" do
      get "/google_login/oauth"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /callback" do
    it "returns http success" do
      get "/google_login/callback"
      expect(response).to have_http_status(:success)
    end
  end

end
