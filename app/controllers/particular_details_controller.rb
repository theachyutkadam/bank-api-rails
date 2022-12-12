class ParticularDetailsController < ApplicationController
  before_action :set_particular_user, only: %i[destroy show update]
  def index
    @particular_details = ParticularDetail.all
    render json: @particular_details
  end

  def create
    @particular_user = ParticularDetail.new(particular_user_params)
    if @particular_user.save
      render json: @particular_user, status: :created
    else
      render json: @particular_user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @particular_user.update_attributes(particular_user_params)
      render json: @particular_user, status: :updated
    else
      render json: @particular_user.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @particular_user
  end

  def delete
    if @particular_user.destroy
      head :no_content
    else
      render json: @particular_user.errors, status: :unprocessable_entity
    end
  end

  private

  def particular_user_params
    params.permit(
      :particular_id,
      :receiver_id,
      :sender_id
    )
  end

  def set_particular_user
    @particular_user = ParticularDetail.find(params[:id])
  end
end
