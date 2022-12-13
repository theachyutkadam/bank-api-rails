class ParticularsController < ApplicationController
  before_action :set_particular, only: %i[destroy show update]
  def index
    @particulars = Particular.includes(:customer, :card).all
    render json: @particulars
  end

  def create
    @particular = Particular.new(particular_params)
    if @particular.save
      render json: @particular, status: :created
    else
      render json: @particular.errors, status: :unprocessable_entity
    end
  end

  def update
    if @particular.update_attributes(particular_params)
      render json: @particular, status: :updated
    else
      render json: @particular.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @particular
  end

  def delete
    if @particular.destroy
      head :no_content
    else
      render json: @particular.errors, status: :unprocessable_entity
    end
  end

  private

  def particular_params
    params.permit(
      :credit_amount,
      :current_balance,
      :debit_amount,
      :card_id,
      :customer_id
    )
  end

  def set_particular
    @particular = Particular.find(params[:id])
  end
end
