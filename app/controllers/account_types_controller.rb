class AccountTypesController < ApplicationController
  before_action :set_account_type, only: :destroy
  def index
    @account_types = AccountType.all
    render json: @account_types
  end

  def create
    @account_type = AccountType.create(account_type_params)
    if @account_type
      render json: @account_type, status: :created
    else
      render json: @account_type.errors, status: :unprocessable_entity
    end
  end

  def update; end

  def show; end

  def delete; end

  private
  def account_type_params
    params.permit(:loan_intrest_rate, :saving_intrest_rate, :title)
  end

  def set_account_type
    @account_type = AccountType.find(params[:id])
  end

end
