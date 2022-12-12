require 'rails_helper'

RSpec.describe 'Card', type: :request do
  describe 'GET #index' do
    let!(:cards) { FactoryBot.create_list(:card, 5) }
    before { get '/cards' }
    it 'returns all cards' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:customer) { create(:customer) }
    let(:card) { build(:card, customer:) }
    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post '/cards', params: card.attributes
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET #show' do
    before { get "/cards/#{card.id}" }
    let(:card) { create(:card) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
