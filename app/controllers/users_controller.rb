class UsersController < ApplicationController
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

  def delete
    if @user.destroy
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user.password == params[:password]
      return render json: { message: "You already logged in", auth_token: @user.token } if @user.token.present?
      token = @user.generate_token
      @user.update(token: token)
      render json: { auth_token: token }
    else
      render json: { errors: user.message }, status: :unauthorized
    end
  end

  def logout
    if @@current_user.update(token: "")
      render json: { auth_token: "Logout successfully" }
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
      :token,
      :is_deleted,
      :is_admin
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
