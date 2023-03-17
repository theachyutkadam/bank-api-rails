# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Employee", type: :request do
  let(:user) { create(:user) }
  let(:department) { create(:department) }
  let(:account_type) { create(:account_type) }
  let(:customer) { create(:customer, account_type: account_type) }
  let(:customer1) { create(:customer, account_type: account_type) }
  let(:customer2) { create(:customer, account_type: account_type) }
  let(:customer3) { create(:customer, account_type: account_type) }
  let(:manager) { create(:manager, user: user, department: department) }
  # let!(:user_information) { create(:user_information, user: user, accountable: employee) }

  describe "GET #index" do
    let!(:employee) { create(:employee, department: department, manager: manager, customer: customer) }
    before { get "/api/employees", headers: { Authorization: user.token } }
    it "returns all employees" do
      expect(JSON.parse(response.body).size).to eq(1)
    end
    it "returns status code 200" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:employee) { build(:employee, department: department, manager: manager, customer: customer3) }
    context "when request attributes are valid" do
      it "returns status code 201" do
        post "/api/employees", params: employee.attributes, headers: { Authorization: user.token }
        expect(response).to have_http_status(201)
      end
    end
  end

  describe "GET #show" do
    before { get "/api/employees/#{employee.id}", headers: { Authorization: user.token } }
    let(:employee) { create(:employee, department: department, manager: manager, customer: customer2) }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
