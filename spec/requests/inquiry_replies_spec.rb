require 'rails_helper'

RSpec.describe 'InquiryReplies', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/inquiry_replies/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      get '/inquiry_replies/create'
      expect(response).to have_http_status(:success)
    end
  end
end
