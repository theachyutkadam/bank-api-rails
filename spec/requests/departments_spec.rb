require 'rails_helper'

RSpec.describe 'Department', type: :request do
  describe 'GET #index' do
    let!(:departments) { FactoryBot.create_list(:department, 5) }
    before { get '/departments' }
    it 'returns all departments' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:department) { build(:department) }
    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post '/departments', params: department.attributes
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET #show' do
    before { get "/departments/#{department.id}" }
    let(:department) { create(:department) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
