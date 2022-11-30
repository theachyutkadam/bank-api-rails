require 'rails_helper'

RSpec.describe 'User', type: :request do
  describe 'GET #index' do
    let!(:users) { FactoryBot.create_list(:user, 5) }
    before { get '/users' }
    it 'returns all users' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:customer) { create(:customer) }
    let(:address) { create(:address) }
    let(:user_attributes) { build(:user, accountable: customer, address: address) }
    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post '/users', params: user_attributes.attributes
        expect(response).to have_http_status(201)
      end
    end
  end

  describe "GET #show" do
    before { get "/users/#{user.id}" }
    let(:user) { create(:user) }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
