# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserInformation, type: :request do
  let(:user) { create(:user) }
  let(:account_type) { create(:account_type, title: "Saving") }
  let(:customer) { create(:customer, account_type: account_type) }

  describe "GET #index" do
    let!(:user_informations) { FactoryBot.create_list(:user_information, 5, user: user, accountable: customer) }
    before { get "/user_informations", headers: { Authorization: user.token } }
    it "returns all user_informations" do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it "returns status code 200" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:user_information) { build(:user_information, user: user, accountable: customer) }
    context "when request attributes are valid" do
      it "returns status code 201" do
        post "/user_informations", params: user_information.attributes, headers: { Authorization: user.token }
        expect(response).to have_http_status(201)
      end
    end
  end

  describe "GET #show" do
    before { get "/user_informations/#{user_information.id}", headers: { Authorization: user.token } }
    let(:user_information) { create(:user_information, user: user, accountable: customer) }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
