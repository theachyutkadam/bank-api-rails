require 'rails_helper'

# RSpec.describe 'User', type: :request do
#   describe 'GET #index' do
#     let!(:users) { FactoryBot.create_list(:user, 5) }
#     before { get '/users', headers: { Authorization: User.last.token } }
#     it 'returns all users' do
#       expect(JSON.parse(response.body).size).to eq(5)
#     end
#     it 'returns status code 200' do
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe 'POST #create' do
#     let(:user) { build(:user) }
#     context 'when request attributes are valid' do
#       it 'returns status code 201' do
#         post '/users', params: user.attributes
#         expect(response).to have_http_status(201)
#       end
#     end
#   end

#   describe 'GET #show' do
#     before { get "/users/#{user.id}", headers: { Authorization: user.token } }
#     let(:user) { create(:user) }

#     it 'returns http success' do
#       expect(response).to have_http_status(:success)
#     end
#   end
# end


require "swagger_helper"
RSpec.describe "users_controller", type: :request do
  path "/users" do
    post "Create an User" do
      tags "Users"
      consumes "application/json"
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string },
          email: { type: :string },
        },
        required: ["username", "email"],
      }
      response "201", "user created" do
        let(:user) { create(:user) }
        run_test!
      end
      response "422", "invalid request" do
        let(:user) { create(:user, username: "", email: "") }
        run_test!
      end
    end
  end
end