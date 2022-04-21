require 'rails_helper'

RSpec.describe "PrivacyPolicies", type: :request do
  before do
    @company = Company.create(name: "テスト")
    @privacy_policy = PrivacyPolicy.create(content: "テスト雛形", company_id: @company.id)
  end
  describe "GET /show" do
    it "returns http success" do
      get privacy_policy_path(@privacy_policy)
      expect(response).to have_http_status(:success)
    end
  end

end
