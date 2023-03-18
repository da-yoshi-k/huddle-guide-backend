require 'rails_helper'

RSpec.describe 'Api::V1::Works', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/works'
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of works' do
      create(:work, :finding_common_interets)
      create(:work, :good_and_new)
      get '/api/v1/works'
      res = JSON.parse(response.body)
      expect(res['works'].size).to eq(2)
    end
  end
end
