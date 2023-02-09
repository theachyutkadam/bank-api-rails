# frozen_string_literal: true

class AccountTypesController < ApplicationController
  before_action :set_account_type, only: %i[destroy show update]
  def index
    @account_types = AccountType.all
    render json: @account_types
  end

  def create
    @account_type = AccountType.new(account_type_params)
    if @account_type.save
      render json: @account_type, status: :created
    else
      render json: @account_type.errors, status: :unprocessable_entity
    end
  end

  def update
    if @account_type.update(account_type_params)
      render json: @account_type, status: :ok
    else
      render json: @account_type.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @account_type, status: :ok
  end

  def delete
    if @account_type.destroy
      head :no_content
    else
      render json: @account_type.errors, status: :unprocessable_entity
    end
  end

  private

  def account_type_params
    params.permit(:loan_intrest_rate, :saving_intrest_rate, :title)
  end

  def set_account_type
    @account_type = AccountType.find(params[:id])
  end
end
