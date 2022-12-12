require 'rails_helper'

RSpec.describe 'Particular', type: :request do
  describe 'GET #index' do
    let!(:particulars) { FactoryBot.create_list(:particular, 5) }
    before { get '/particulars' }
    it 'returns all particulars' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:card) { create(:card) }
    let(:customer) { create(:customer) }
    let(:particular) { build(:particular, card:, customer:) }
    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post '/particulars', params: particular.attributes
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET #show' do
    before { get "/particulars/#{particular.id}" }
    let(:particular) { create(:particular) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
