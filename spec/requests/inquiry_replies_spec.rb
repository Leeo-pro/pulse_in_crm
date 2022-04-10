require 'rails_helper'

RSpec.describe 'InquiryReplies', type: :request do
<<<<<<< HEAD
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
=======
  describe 'GET /index' do
    pending "add some examples (or delete) #{__FILE__}"
>>>>>>> upstream/main
  end
end
