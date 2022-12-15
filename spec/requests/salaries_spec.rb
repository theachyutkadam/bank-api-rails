require 'rails_helper'

RSpec.describe 'Salary', type: :request do
  describe 'GET #index' do


    let(:user ) { create(:user) }
    let(:department ) { create(:department, name: "Finance") }
    let(:manager ) { create(:manager, user: user, department: department) }

    let(:employee ) { create(:employee, department: department, manager: manager) }
    let(:account_type) { create(:account_type, title: "Saving") }
    let(:customer ) { create(:customer, account_type: account_type) }
    
    let(:card ) { create(:card, customer: customer) }
    let(:particular) { create(:particular, card:card, customer: customer) }
    let!(:salaries) { FactoryBot.create_list(:salary, 5, employee: employee, particular: particular) }

    before { get '/salaries' }
    it 'returns all salaries' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do

    let(:user ) { create(:user) }
    let(:department ) { create(:department, name: "Finance") }
    let(:manager ) { create(:manager, user: user, department: department) }

    let(:employee ) { create(:employee, department: department, manager: manager) }
    let(:account_type) { create(:account_type, title: "Saving") }
    let(:customer ) { create(:customer, account_type: account_type) }

    let(:card ) { create(:card, customer: customer) }
    let(:particular) { create(:particular, card:card, customer: customer) }
    let(:salary) { build(:salary, employee: employee, particular: particular) }

    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post '/salaries', params: salary.attributes
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET #show' do
    before { get "/salaries/#{salary.id}" }

    let(:user ) { create(:user) }
    let(:department ) { create(:department, name: "Finance") }
    let(:manager ) { create(:manager, user: user, department: department) }

    let(:employee ) { create(:employee, department: department, manager: manager) }    
    let(:account_type) { create(:account_type, title: "Saving") }
    let(:customer ) { create(:customer, account_type: account_type) }

    let(:card ) { create(:card, customer: customer) }
    let(:particular) { create(:particular, card:card, customer: customer) }
    let(:salary) { create(:salary, employee: employee, particular: particular) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
