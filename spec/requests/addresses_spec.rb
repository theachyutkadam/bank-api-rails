require 'rails_helper'

RSpec.describe 'Addresses', type: :request do
  let!(:addresses) { FactoryBot.create_list(:address, 20) }
  before { get '/addresses/index' }
  it 'returns all addresses' do
    create_list(:address, 20)
    expect(JSON.parse(response.body).size).to eq(20)
  end
  it 'returns status code 200' do
    create_list(:address, 20)
    expect(response).to have_http_status(:success)
  end
end
