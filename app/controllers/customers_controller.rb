# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :set_user, only: %i[destroy show update]
  def index
    @customers = Customer.includes(:account_type).all
    render json: @customers
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: @customer, status: :created
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @customer
  end

  def delete
    if @customer.destroy
      head :no_content
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  private

  def customer_params
    params.permit(
      :account_number,
      :amount_limit,
      :current_balance,
      :account_type_id,
    )
  end

  def set_user
    @customer = Customer.find(params[:id])
  end
end
