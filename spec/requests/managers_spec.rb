# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Manager", type: :request do
  let(:department) { create(:department) }
  let(:user) { create(:user) }

  describe "GET #index" do
    let!(:managers) { FactoryBot.create_list(:manager, 1, department: department, user: user) }
    before { get "/api/managers", headers: { Authorization: user.token } }
    it "returns all managers" do
      expect(JSON.parse(response.body).size).to eq(1)
    end
    it "returns status code 200" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:manager) { build(:manager, department: department, user: user) }
    context "when request attributes are valid" do
      it "returns status code 201" do
        post "/api/managers", params: manager.attributes, headers: { Authorization: user.token }
        expect(response).to have_http_status(201)
      end
    end
  end

  describe "GET #show" do
    before { get "/api/managers/#{manager.id}", headers: { Authorization: user.token } }
    let!(:manager) { build(:manager, department: department, user: user) }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
