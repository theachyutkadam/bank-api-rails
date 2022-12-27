require 'rails_helper'

RSpec.describe 'Card', type: :request do
  let(:account_type) { create(:account_type) }
  let(:user) { create(:user) }
  let(:customer) { create(:customer, account_type: account_type) }
  describe 'GET #index' do
    let!(:cards) { create_list(:card, 2, customer: customer) }
    before { get '/cards', headers: { Authorization: user.token } }
    it 'returns all cards' do
      expect(JSON.parse(response.body).size).to eq(2)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let!(:card) { build(:card, status: 0, customer: customer) }
    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post '/cards', params: card.attributes, headers: { Authorization: user.token }
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET #show' do
    before { get "/cards/#{card.id}", headers: { Authorization: user.token } }
    let(:card) { create(:card, status: 0, customer: customer) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
