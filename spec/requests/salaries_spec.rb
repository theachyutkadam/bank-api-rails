require 'rails_helper'

RSpec.describe 'Salary', type: :request do
  describe 'GET #index' do
    let!(:salaries) { FactoryBot.create_list(:salary, 5) }
    before { get '/salaries' }
    it 'returns all salaries' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:employee) { create(:employee) }
    let(:particular) { create(:particular) }
    let(:department) { build(:salary, employee:, particular:) }
    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post '/salaries', params: department.attributes
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET #show' do
    before { get "/salaries/#{salary.id}" }
    let(:salary) { create(:salary) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
