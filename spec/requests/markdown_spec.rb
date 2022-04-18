require 'rails_helper'

RSpec.describe "Markdowns", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/markdown/index"
      expect(response).to have_http_status(:success)
    end
  end

end
