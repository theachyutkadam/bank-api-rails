class UserInformationsController < ApplicationController
  before_action :set_user, only: %i[destroy show update]
  def index
    @user_informations = UserInformation.includes(:user, :accountable).all
    render json: @user_informations
  end

  def create
    ActiveRecord::Base.transaction do
      @user_information = UserInformation.new(user_information_params)
      customer = Customer.create()
      @user_information.update(accountable: customer)
      if @user_information.save
        render json: @user_information, status: :created
      else
        render json: @user_information.errors, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordInvalid
      puts "Oops. We tried to do an invalid operation!"
    end
  end

  def update
    if @user_information.update_attributes(user_information_params)
      render json: @user_information, status: :updated
    else
      render json: @user_information.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @user_information
  end

  def delete
    if @user_information.destroy
      head :no_content
    else
      render json: @user_information.errors, status: :unprocessable_entity
    end
  end

  private

  def user_information_params
    params.permit(
      :gender,
      :contact,
      :user_id,
      :last_name,
      :birth_date,
      :first_name,
      :middle_name,
      :is_handicap,
      :accountable_id,
      :maritial_status,
      :pan_card_number,
      :accountable_type,
      :handicap_details,
      :adhaar_card_number
    )
  end

  def set_user
    @user_information = UserInformation.find(params[:id])
  end
end
