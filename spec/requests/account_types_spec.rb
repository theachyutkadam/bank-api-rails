require 'rails_helper'

RSpec.describe 'AccountType', type: :request do
  let!(:account_types) { FactoryBot.create_list(:account_type, 20) }
  before { get '/account_types/index' }
  it 'returns all account_types' do
    expect(JSON.parse(response.body).size).to eq(20)
  end
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
