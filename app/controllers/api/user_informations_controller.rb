# frozen_string_literal: true

module Api
  class UserInformationsController < ApplicationController
    before_action :set_user_information, only: %i[destroy show update]

    def index
      # return only active users
      @user_informations = UserInformation.where(user_id: User.active.ids).where.not(id: current_user_information.id)
      render json: @user_informations
    end

    def create
      ActiveRecord::Base.transaction do
        @user_information = UserInformation.new(user_information_params)
        customer = Customer.create
        @user_information.update(accountable: customer)
        if @user_information.save
          render json: @user_information, status: :created
        else
          render json: @user_information.errors, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordInvalid
        Rails.logger.debug "Oops. We tried to do an invalid operation!"
      end
    end

    def update
      if @user_information.update(user_information_params)
        render json: @user_information
      else
        render json: @user_information.errors, status: :unprocessable_entity
      end
    end

    def show
      render json: @user_information
    end

    def destroy
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
        :adhaar_card_number,
      )
    end

    def set_user_information
      @user_information = UserInformation.find(params[:id])
    end
  end
end
