# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Department", type: :request do
  let(:user) { create(:user) }
  describe "GET #index" do
    let!(:departments) { FactoryBot.create_list(:department, 2) }
    before { get "/api/departments", headers: { Authorization: user.token } }
    it "returns all departments" do
      expect(JSON.parse(response.body).size).to eq(2)
    end
    it "returns status code 200" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:department) { build(:department) }
    context "when request attributes are valid" do
      it "returns status code 201" do
        post "/api/departments", params: department.attributes, headers: { Authorization: user.token }
        expect(response).to have_http_status(201)
      end
    end
  end

  describe "GET #show" do
    before { get "/api/departments/#{department.id}", headers: { Authorization: user.token } }
    let(:department) { create(:department) }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
