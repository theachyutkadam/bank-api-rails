# frozen_string_literal: true

module Api
  class ParticularsController < ApplicationController
    include Rails.application.routes.url_helpers

    before_action :set_particular, only: %i[destroy show update]

    def index
      @particulars = Particular.where("receiver_id = ?  OR sender_id = ?", current_user_information.id,
                                      current_user_information.id)
      render json: @particulars
    end

    def create
      ActiveRecord::Base.transaction do
        @particular = Particular.new(particular_params)
        if @particular.save
          @particular.update_current_balance(params[:sender_id], params[:receiver_id], params[:amount])
          @particular.reload
          render json: @particular, status: :created
        else
          render json: @particular.errors, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordInvalid
        Rails.logger.debug "Oops. We tried to do an invalid operation!"
      end
    end

    def update
      if @particular.update(particular_params)
        render json: @particular
      else
        render json: @particular.errors, status: :unprocessable_entity
      end
    end

    def show
      render json: @particular
    end

    def destroy
      if @particular.destroy
        head :no_content
      else
        render json: @particular.errors, status: :unprocessable_entity
      end
    end

    private

    def particular_params
      params.permit(
        :amount,
        :card_id,
        :sender_id,
        :receiver_id,
      )
    end

    def set_particular
      @particular = Particular.find(params[:id])
    end
  end
end
