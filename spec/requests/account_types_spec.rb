require 'rails_helper'

RSpec.describe 'AccountType', type: :request do
  context "Index method" do
    let!(:account_types) { FactoryBot.create_list(:account_type, 20) }
    before { get '/account_types/index' }
    it 'returns all account_types' do
      expect(JSON.parse(response.body).size).to eq(20)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  context 'Create method' do
    let(:account_type_attributes) { build(:account_type) }
    context 'when request attributes are valid' do
      # before { post '/account_types/create', params: account_type_attributes }
      # before { post '/account_types/create', params: { title: "sample", loan_intrest_rate: 45.98, saving_intrest_rate: 26.39 } }
      it 'returns status code 201' do
        post '/account_types/create', params: { title: "sample", loan_intrest_rate: 45.98, saving_intrest_rate: 26.39 }
        expect(response).to have_http_status(201)
      end
    end
  end
end
