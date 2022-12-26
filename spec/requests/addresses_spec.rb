require 'rails_helper'

RSpec.describe 'Addresses', type: :request do
  let(:account_type ) { create(:account_type) }
  let(:user ) { create(:user) }
  let(:customer ) { create(:customer, account_type: account_type) }
  
  describe 'GET #index' do
    let!(:addresses) { FactoryBot.create_list(:address, 5, addressable: customer) }
    before { get '/addresses', headers: {:Authorization => user.token} }
    it 'returns all addresses' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:address) { build(:address, addressable: customer) }
    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post '/addresses', params: address.attributes, headers: {:Authorization => user.token}
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET #show' do
    before { get "/addresses/#{address.id}", headers: {:Authorization => user.token} }
    let(:address) { create(:address, addressable: customer) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
