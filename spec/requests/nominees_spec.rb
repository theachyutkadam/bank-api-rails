require 'rails_helper'

RSpec.describe 'Nominee', type: :request do
  let(:account_type) { create(:account_type) }
  let(:user) { create(:user) }
  let!(:user_informations) { create(:user_information, user: user, accountable: customer) }
  let(:customer) { create(:customer, account_type: account_type) }

  describe 'GET #index' do
    let!(:nominees) { FactoryBot.create_list(:nominee, 5, customer: customer) }
    before { get '/nominees', headers: { Authorization: user.token } }
    it 'returns all nominees' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:nominee) { build(:nominee, customer: customer) }
    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post '/nominees', params: nominee.attributes, headers: { Authorization: user.token }
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET #show' do
    before { get "/nominees/#{nominee.id}", headers: { Authorization: user.token } }
    let(:nominee) { create(:nominee, customer: customer) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
