class AddressesController < ApplicationController
  before_action :set_user, only: %i[destroy show update]
  def index
    @addresss = Address.includes(:addressable).all
    render json: @addresss
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      render json: @address, status: :created
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  def update
    if @address.update_attributes(address_params)
      render json: @address, status: :updated
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @address
  end

  def delete
    if @address.destroy
      head :no_content
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.permit(
      :addressable_type,
      :building,
      :description,
      :flat_number,
      :pin_code,
      :street,
      :addressable_id
    )
  end

  def set_user
    @address = Address.find(params[:id])
  end
end
