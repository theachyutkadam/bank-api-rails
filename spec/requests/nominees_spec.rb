# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Nominee", type: :request do
  let(:account_type) { create(:account_type) }
  let(:user) { create(:user) }
  let(:customer) { create(:customer, account_type: account_type) }
  let!(:user_information) { create(:user_information, user: user, accountable: customer) }
  let(:user2) { create(:user) }
  let(:customer2) { create(:customer, account_type: account_type) }
  let!(:user_information2) { create(:user_information, user: user2, accountable: customer2) }

  describe "GET #index" do
    let!(:nominees) { FactoryBot.create_list(:nominee, 1, customer: customer2) }
    before { get "/api/nominees", headers: { Authorization: user2.token } }
    it "returns all nominees" do
      expect(JSON.parse(response.body).size).to eq(8)
    end
    it "returns status code 200" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:nominee) { build(:nominee, customer: customer) }
    context "when request attributes are valid" do
      it "returns status code 201" do
        post "/api/nominees", params: nominee.attributes, headers: { Authorization: user.token }
        expect(response).to have_http_status(201)
      end
    end
  end

  describe "GET #show" do
    before { get "/api/nominees/#{address.addressable_id}", headers: { Authorization: user.token } }
    let(:nominee) { create(:nominee, customer: customer) }
    let(:address) { create(:address, addressable: nominee, building: "LR/R16-G") }

    context "when request attributes are valid" do

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
