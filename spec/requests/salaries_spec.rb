require 'rails_helper'

RSpec.describe 'Salary', type: :request do
  describe 'GET #index' do
    # before(:each) do
    # create create manager
    let(:manager_user) { create(:user) }
    let(:department) { create(:department, name: "Finance") }
    let(:account_type ) { create(:account_type) }
    let(:customer ) { create(:customer, account_type: account_type) }
    let(:manager) { create(:manager, user: manager_user, department: department) }
    let(:manager_employee) { create(:employee, manager: manager, department: department, customer: customer) }
    let!(:manager_user_information) { create(:user_information, user: manager_user, accountable: manager_employee) }

    # create employee
    let(:employee_user) { create(:user) }
    let(:department) { create(:department, name: "HR") }
    let(:account_type ) { create(:account_type) }
    let(:customer ) { create(:customer, account_type: account_type) }
    let(:manager) { create(:manager, user: employee_user, department: department) }
    let(:employee) { create(:employee, manager: manager, department: department, customer: customer) }
    let(:employee_user_information) { create(:user_information, user: employee_user, accountable: employee) }

    # create admin customer
    let(:account_type) { create(:account_type) }
    let(:admin_user) { create(:user, is_admin: true, email: 'admin@gmail.com') }
    let(:admin_customer) { create(:customer, account_type: account_type, current_balance: 1_000_000.00) }
    let(:admin_card) { create(:card, customer: admin_customer) }

    let(:admin_sender) { create(:user_information, user: admin_user, accountable: admin_customer) }
    let(:particular) { create(:particular, card: admin_card, sender: admin_sender, receiver: employee_user_information) }
    # end
    let!(:salaries) { FactoryBot.create_list(:salary, 2, particular: particular, employee: employee) }

    before { get '/salaries' }
    it 'returns all salaries' do
      expect(JSON.parse(response.body).size).to eq(2)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    # create create manager
    let(:manager_user) { create(:user) }
    let(:department) { create(:department, name: "Finance") }
    let(:manager) { create(:manager, user: manager_user, department: department) }

    let(:account_type ) { create(:account_type) }
    let(:customer ) { create(:customer, account_type: account_type) }

    let(:manager_employee) { create(:employee, manager: manager, department: department, customer: customer) }
    let!(:manager_user_information) { create(:user_information, user: manager_user, accountable: manager_employee) }

    # create employee
    let(:employee_user) { create(:user) }
    let(:department) { create(:department, name: "HR") }
    let(:manager) { create(:manager, user: employee_user, department: department) }


    let(:account_type ) { create(:account_type) }
    let(:customer ) { create(:customer, account_type: account_type) }
    let(:employee) { create(:employee, manager: manager, department: department, customer: customer) }
    let(:employee_user_information) { create(:user_information, user: employee_user, accountable: employee) }

    # create admin customer
    let(:account_type) { create(:account_type) }
    let(:admin_user) { create(:user, is_admin: true, email: 'admin@gmail.com') }
    let(:admin_customer) { create(:customer, account_type: account_type, current_balance: 1_000_000.00) }
    let(:admin_card) { create(:card, customer: admin_customer) }

    let(:admin_sender) { create(:user_information, user: admin_user, accountable: admin_customer) }
    let(:particular) { create(:particular, card: admin_card, sender: admin_sender, receiver: employee_user_information) }
    let!(:salary) { build(:salary, particular: particular, employee: employee) }

    context 'when request attributes are valid' do
      it 'returns status code 201' do
        post '/salaries', params: salary.attributes
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET #show' do
    before { get "/salaries/#{salary.id}" }
    # create create manager
    let(:manager_user) { create(:user) }
    let(:department) { create(:department, name: "Finance") }
    let(:manager) { create(:manager, user: manager_user, department: department) }
    let(:account_type ) { create(:account_type) }
    let(:customer ) { create(:customer, account_type: account_type) }

    let(:manager_employee) { create(:employee, manager: manager, department: department, customer: customer) }
    let!(:manager_user_information) { create(:user_information, user: manager_user, accountable: manager_employee) }

    # create employee
    let(:employee_user) { create(:user) }
    let(:department) { create(:department, name: "HR") }
    let(:manager) { create(:manager, user: employee_user, department: department) }

    let(:account_type ) { create(:account_type) }
    let(:customer ) { create(:customer, account_type: account_type) }
    let(:employee) { create(:employee, manager: manager, department: department, customer: customer) }

    let(:employee_user_information) { create(:user_information, user: employee_user, accountable: employee) }

    # create admin customer
    let(:account_type) { create(:account_type) }
    let(:admin_user) { create(:user, is_admin: true, email: 'admin@gmail.com') }
    let(:admin_customer) { create(:customer, account_type: account_type, current_balance: 1_000_000.00) }
    let(:admin_card) { create(:card, customer: admin_customer) }

    let(:admin_sender) { create(:user_information, user: admin_user, accountable: admin_customer) }
    let(:particular) { create(:particular, card: admin_card, sender: admin_sender, receiver: employee_user_information) }
    let!(:salary) { create(:salary, particular: particular, employee: employee) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
