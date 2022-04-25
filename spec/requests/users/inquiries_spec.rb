require 'rails_helper'

RSpec.describe 'Users::Inquiries', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/inquiries/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/inquiries/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/users/inquiries/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
