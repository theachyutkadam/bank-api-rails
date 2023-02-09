# frozen_string_literal: true

class NomineesController < ApplicationController
  before_action :set_user, only: %i[destroy show update]
  def index
    @nominees = Nominee.includes(:customer).all
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
    render json: @nominee
  end

  def delete
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
