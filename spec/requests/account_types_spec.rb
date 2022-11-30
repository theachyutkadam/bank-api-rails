require 'rails_helper'

RSpec.describe 'AccountType', type: :request do
  describe 'GET #index' do
    let!(:account_types) { FactoryBot.create_list(:account_type, 5) }
    before { get '/account_types' }
    it 'returns all account_types' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:account_type_attributes) { build(:account_type) }
    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post '/account_types', params: account_type_attributes.attributes
        expect(response).to have_http_status(201)
      end
    end
  end

  describe "GET #show" do
    before { get "/account_types/#{account_type.id}" }
    let(:account_type) { create(:account_type) }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
