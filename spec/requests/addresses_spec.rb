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
end
