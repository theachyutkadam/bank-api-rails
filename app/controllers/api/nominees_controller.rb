# frozen_string_literal: true

module Api
  class NomineesController < ApplicationController
    before_action :set_user, only: %i[destroy show update]
    def index
      accountable = current_user_information.accountable
      @nominees = if accountable.instance_of?(::Customer)
        accountable.nominee
      else
        accountable.customer.nominee
      end
      render json: @nominees
    end

    def create
      @nominee = Nominee.new(nominee_params)
      if @nominee.save
        render json: @nominee, status: :created
      else
        render json: @nominee.errors, status: :unprocessable_entity
      end
    end

    def update
      if @nominee.update(nominee_params)
        render json: @nominee
      else
        render json: @nominee.errors, status: :unprocessable_entity
      end
    end

    def show
      if @nominee.address.nil?
        return render json: { errors: "Address must be required for nominee." },
                      status: :unprocessable_entity
      end

      render json: @nominee
    end

    def destroy
      if @nominee.destroy
        head :no_content
      else
        render json: @nominee.errors, status: :unprocessable_entity
      end
    end

    private

    def nominee_params
      params.permit(
        :contact,
        :first_name,
        :gender,
        :last_name,
        :middle_name,
        :relation,
        :customer_id,
      )
    end

    def set_user
      @nominee = Nominee.find(params[:id])
    end
  end
end
