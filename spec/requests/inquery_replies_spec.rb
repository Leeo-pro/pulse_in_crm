require 'rails_helper'

RSpec.describe "InqueryReplies", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/inquery_replies/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/inquery_replies/create"
      expect(response).to have_http_status(:success)
    end
  end

end
