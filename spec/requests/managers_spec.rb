require 'rails_helper'

RSpec.describe 'Manager', type: :request do
  describe 'GET #index' do
    let!(:department ) { create(:department) }
    let!(:user ) { create(:user) }
    let!(:managers) { FactoryBot.create_list(:manager, 5, department: department, user:user) }
    before { get '/managers', headers: {:Authorization => user.token} }
    it 'returns all managers' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let!(:department ) { create(:department) }
    let!(:user ) { create(:user) }
    let(:manager ) { build(:manager, department: department, user:user) }
    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post '/managers', params: manager.attributes, headers: {:Authorization => user.token}
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET #show' do
    before { get "/managers/#{manager.id}", headers: {:Authorization => user.token} }
    let!(:department ) { create(:department) }
    let!(:user ) { create(:user) }
    let!(:manager ) { build(:manager, department: department, user:user) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
