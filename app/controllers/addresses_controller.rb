class AddressesController < ApplicationController
  def index
    @addresses = Address.all
    render json: @addresses
  end



  def create
  end

  def update
  end

  def show
  end

  def delete
  end
end
