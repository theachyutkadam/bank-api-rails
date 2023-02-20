# frozen_string_literal: true

class Api::UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[login create]
  before_action :set_user, only: %i[destroy show update]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @user
  end

  def destroy
    if @user.destroy!
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: params[:email])
    return render json: { errors: "User does not found", status: 400} unless @user

    if @user.password == params[:password]
      # return render json: { user_information_id: @user.user_information.id, auth_token: @user.token, status: 200 } if @user.token
      token = @user.generate_token
      @user.update(token: token)
      render json: { user_information_id: @user.user_information.id, auth_token: token, status: 200 }
    else
      render json: { errors: "Invalid credentials", status: 400 }
    end
  end

  def logout
    if current_user.update(token: nil)
      current_user = ""
      render json: { auth_token: "Logout successfully!!!" }
    else
      render json: { errors: "Something went wrong" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(
      :username,
      :password,
      :email,
      :status,
      :is_deleted,
      :is_admin,
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
