class SalariesController < ApplicationController
  before_action :set_user, only: %i[destroy show update]
  def index
    @salaries = Salary.all
    render json: @salaries
  end

  def create
    @salary = Salary.new(user_params)
    if @salary.save
      render json: @salary, status: :created
    else
      render json: @salary.errors, status: :unprocessable_entity
    end
  end

  def update
    if @salary.update_attributes(user_params)
      render json: @salary, status: :updated
    else
      render json: @salary.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @salary
  end

  def delete
    if @salary.destroy
      head :no_content
    else
      render json: @salary.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(
      :status,
      :amount,
      :employee_id,
      :particular_id
    )
  end

  def set_user
    @salary = Salary.find(params[:id])
  end
end
