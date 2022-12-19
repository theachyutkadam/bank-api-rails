require 'rails_helper'

RSpec.describe 'Employee', type: :request do
  describe 'GET #index' do
    let(:user ) { create(:user) }
    let(:department ) { create(:department) }
    let(:account_type ) { create(:account_type) }
    let(:customer ) { create(:customer, account_type: account_type) }
    let(:manager ) { create(:manager, user: user, department: department) }
    let!(:employee) { create(:employee, department: department, manager: manager, customer: customer) }
    let!(:user_information) { create(:user_information, user: user, accountable: employee) }

    before { get '/employees' }
    it 'returns all employees' do
      expect(JSON.parse(response.body).size).to eq(1)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    after do
      user_information 
    end
    let(:user_information) { create(:user_information, user: user, accountable: employee) }
    let(:user ) { create(:user) }
    let(:department ) { create(:department) }
    let(:account_type ) { create(:account_type) }
    let(:customer ) { create(:customer, account_type: account_type) }
    let(:manager ) { create(:manager, user: user, department: department) }

    let(:employee ) { build(:employee, department: department, manager: manager, customer: customer) }
    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post '/employees', params: employee.attributes
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET #show' do
    before { get "/employees/#{employee.id}" }
    let!(:user_information) { create(:user_information, user: user, accountable: employee) }
    after do
      user_information 
    end
    let(:user ) { create(:user) }
    let(:department ) { create(:department) }
    let(:account_type ) { create(:account_type) }
    let(:customer ) { create(:customer, account_type: account_type) }
    let(:manager ) { create(:manager, user: user, department: department) }
    let(:employee) { create(:employee, department: department, manager: manager, customer: customer) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
