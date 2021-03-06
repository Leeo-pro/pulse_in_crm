require 'rails_helper'

RSpec.describe 'Users::PrivacyPolicies', type: :request do
  describe 'POST /create' do
    let!(:company) { Company.create(name: 'テスト', email: 'Test@email.com') }
    let!(:privacy_policy) { PrivacyPolicy.create(content: 'テスト雛形', company_id: company.id) }

    it 'returns http success' do
      get '/sign_up'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    let!(:company) { Company.create(name: 'テスト', email: 'Test@email.com') }
    let!(:privacy_policy) { PrivacyPolicy.create(content: 'テスト雛形', company_id: company.id) }

    it 'returns http success' do
      get edit_users_privacy_policy_path(privacy_policy)
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'PATCH /update' do
    let!(:company) { Company.create(name: 'テスト', email: 'Test@email.com') }
    let!(:privacy_policy) { PrivacyPolicy.create(content: 'テスト雛形', company_id: company.id) }

    it 'returns http success' do
      patch users_privacy_policy_path(privacy_policy)
      expect(response).to have_http_status(:redirect)
    end
  end
end
