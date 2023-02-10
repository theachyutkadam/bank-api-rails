# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User", type: :request do
  describe "GET #index" do
    let!(:users) { FactoryBot.create_list(:user, 5) }
    before { get "/users", headers: { Authorization: User.last.token } }
    it "returns all users" do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it "returns status code 200" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:user) { build(:user) }
    context "when request attributes are valid" do
      it "returns status code 201" do
        post "/users", params: user.attributes
        expect(response).to have_http_status(201)
      end
    end
  end

  describe "GET #show" do
    let(:user) { create(:user) }
    before { get "/users/#{user.id}", headers: { Authorization: user.token } }
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #delete" do
    let(:user) { create(:user) }
    before { delete "/users/#{user.id}", headers: { Authorization: user.token } }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #login" do
    let(:user) { create(:user) }
    let(:user_attributes) { {email: user.email, password: user.password } }
    context "when request for login" do
      it "returns status code 201" do
        post "/users/login", params: user_attributes
        expect(response).to have_http_status(200)
        message = JSON.parse(response.body)["message"]
        expect(message).to eq("You already logged in")
      end
    end
  end

  describe "POST #login" do
    let(:user) { create(:user, token: "")}
    let(:user_attributes) { {email: user.email, password: user.password } }
    context "when request for login" do
      it "returns status code 201 and token" do
        post "/users/login", params: user_attributes
        expect(response).to have_http_status(200)
        user.reload
        token = JSON.parse(response.body)["auth_token"]
        expect(token).to eq(user.token)
      end
    end
  end

  describe "POST #login" do
    let(:user_attributes) { {email: "sample@gmail.com", password: "654321" } }
    context "when request for login" do
      it "returns status code 401" do
        post "/users/login", params: user_attributes
        error = JSON.parse(response.body)["errors"]
        expect(error).to eq("User does not found")
      end
    end
  end
end
