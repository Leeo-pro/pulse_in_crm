require 'rails_helper'

RSpec.describe "Users::PrivacyPolicies", type: :request do

  describe "POST /create" do
    it "returns http success" do
      get "/users/privacy_policy/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/users/privacy_policy/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /update" do
    it "returns http success" do
      get "/users/privacy_policy/update"
      expect(response).to have_http_status(:success)
    end
  end

end
