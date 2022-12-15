class DepartmentsController < ApplicationController
  before_action :set_user, only: %i[destroy show update]
  def index
    @departments = Department.all
    render json: @departments
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      render json: @department, status: :created
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  def update
    if @department.update(department_params)
      render json: @department
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @department
  end

  def delete
    if @department.destroy
      head :no_content
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  private

  def department_params
    params.permit(
      :name,
      :employee_count
    )
  end

  def set_user
    @department = Department.find(params[:id])
  end
end
