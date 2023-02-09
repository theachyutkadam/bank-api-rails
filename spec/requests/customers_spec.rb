# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Customer", type: :request do
  let(:account_type) { create(:account_type) }
  let(:user) { create(:user) }
  describe "GET #index" do
    let!(:customers) { FactoryBot.create_list(:customer, 5, account_type: account_type) }
    before { get "/customers", headers: { Authorization: user.token } }
    it "returns all customers" do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it "returns status code 200" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:customer) { build(:customer, account_type: account_type) }
    context "when request attributes are valid" do
      it "returns status code 201" do
        post "/customers", params: customer.attributes, headers: { Authorization: user.token }
        expect(response).to have_http_status(201)
      end
    end
  end

  describe "GET #show" do
    before { get "/customers/#{customer.id}", headers: { Authorization: user.token } }
    let(:customer) { build(:customer, account_type: account_type) }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
