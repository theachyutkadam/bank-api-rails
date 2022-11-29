class AccountTypesController < ApplicationController
  def index
    @account_types = AccountType.all
    render json: @account_types
  end

  def create; end

  def update; end

  def show; end

  def delete; end
end
