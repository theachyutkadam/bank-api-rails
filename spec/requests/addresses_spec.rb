require 'rails_helper'

RSpec.describe 'Addresses', type: :request do
  let!(:addresses) { FactoryBot.create_list(:address, 5) }
  before { get '/addresses' }
  it 'returns all addresses' do
    expect(JSON.parse(response.body).size).to eq(5)
  end
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  describe 'POST #create' do
    let(:customer) { create(:customer) }
    let(:address) { build(:address, addressable: customer) }
    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post '/addresses', params: address.attributes
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET #show' do
    before { get "/addresses/#{address.id}" }
    let(:address) { create(:address) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
