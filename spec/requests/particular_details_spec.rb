require 'rails_helper'

RSpec.describe 'ParticularDetail', type: :request do
  describe 'GET #index' do
    let!(:particular_details) { FactoryBot.create_list(:particular_detail, 5) }
    before { get '/particular_details' }
    it 'returns all particular_details' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:particular) { create(:particular) }
    let(:sender) { create(:user) }
    let(:receiver) { create(:user) }
    let(:particular_detail) { build(:particular_detail, receiver:, sender:, particular:) }
    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post '/particular_details', params: particular_detail.attributes
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET #show' do
    before { get "/particular_details/#{particular_detail.id}" }
    let(:particular_detail) { create(:particular_detail) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
