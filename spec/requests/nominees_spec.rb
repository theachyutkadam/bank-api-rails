require 'rails_helper'

RSpec.describe 'Nominee', type: :request do
  describe 'GET #index' do
    let!(:nominees) { FactoryBot.create_list(:nominee, 5) }
    before { get '/nominees' }
    it 'returns all nominees' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:customer) { create(:customer) }
    let(:nominee) { build(:nominee, customer:) }
    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post '/nominees', params: nominee.attributes
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET #show' do
    before { get "/nominees/#{nominee.id}" }
    let(:nominee) { create(:nominee) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
