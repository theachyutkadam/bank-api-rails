require 'rails_helper'

RSpec.describe 'Employee', type: :request do
  describe 'GET #index' do
    let!(:employees) { FactoryBot.create_list(:employee, 5) }
    before { get '/employees' }
    it 'returns all employees' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:department ) { create(:department) }
    let(:manager ) { create(:manager) }
    let(:employee ) { build(:employee, department: department, manager: manager) }
    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post '/employees', params: employee.attributes
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET #show' do
    before { get "/employees/#{employee.id}" }
    let(:employee) { create(:employee) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
