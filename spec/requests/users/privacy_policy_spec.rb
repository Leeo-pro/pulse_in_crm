require 'rails_helper'

RSpec.describe "Users::PrivacyPolicies", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/users/privacy_policy/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
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

  describe "GET /update" do
    it "returns http success" do
      get "/users/privacy_policy/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/users/privacy_policy/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
