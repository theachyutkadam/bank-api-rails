class ManagersController < ApplicationController
  before_action :set_user, only: %i[destroy show update]
  def index
    @managers = Manager.includes(:user, :department).all
    render json: @managers
  end

  def create
    @manager = Manager.new(manager_params)
    if @manager.save
      render json: @manager, status: :created
    else
      render json: @manager.errors, status: :unprocessable_entity
    end
  end

  def update
    if @manager.update(manager_params)
      render json: @manager
    else
      render json: @manager.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @manager
  end

  def delete
    if @manager.destroy
      head :no_content
    else
      render json: @manager.errors, status: :unprocessable_entity
    end
  end

  private

  def manager_params
    params.permit(
      :designation,
      :status,
      :department_id,
      :user_id
    )
  end

  def set_user
    @manager = Manager.find(params[:id])
  end
end
