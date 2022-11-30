class UsersController < ApplicationController
  before_action :set_user, only: [:destroy, :show, :update]
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
    if @user.update_attributes(user_params)
      render json: @user, status: :updated
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

  private

  def user_params
    params.permit(
      :username,
      :password,
      :email,
      :first_name,
      :middle_name,
      :last_name,
      :contact,
      :birth_date,
      :gender,
      :is_active,
      :is_deleted,
      :accountable_id,
      :accountable_type,
      :pan_card_number,
      :adhaar_card_number,
      :is_handicap,
      :handicap_details,
      :maritial_status,
      :address_id,
      :is_admin
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
