class ParticularDetailsController < ApplicationController
  before_action :set_particular_detail, only: %i[destroy show update]
  def index
    @particular_details = ParticularDetail.includes(:particular, :sender, :receiver).all
    render json: @particular_details
  end

  def create
    @particular_detail = ParticularDetail.new(particular_detail_params)
    if @particular_detail.save
      render json: @particular_detail, status: :created
    else
      render json: @particular_detail.errors, status: :unprocessable_entity
    end
  end

  def update
    if @particular_detail.update_attributes(particular_detail_params)
      render json: @particular_detail, status: :updated
    else
      render json: @particular_detail.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @particular_detail
  end

  def delete
    if @particular_detail.destroy
      head :no_content
    else
      render json: @particular_detail.errors, status: :unprocessable_entity
    end
  end

  private

  def particular_detail_params
    params.permit(
      :particular_id,
      :receiver_id,
      :sender_id
    )
  end

  def set_particular_detail
    @particular_detail = ParticularDetail.find(params[:id])
  end
end
