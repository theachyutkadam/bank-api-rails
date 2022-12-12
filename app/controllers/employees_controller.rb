class EmployeesController < ApplicationController
  before_action :set_user, only: %i[destroy show update]
  def index
    @employees = Employee.all
    render json: @employees
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      render json: @employee, status: :created
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  def update
    if @employee.update_attributes(employee_params)
      render json: @employee, status: :updated
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @employee
  end

  def delete
    if @employee.destroy
      head :no_content
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  private

  def employee_params
    params.permit(
      :date_of_joining,
      :designation,
      :education,
      :official_email,
      :work_status,
      :department_id,
      :manager_id
    )
  end

  def set_user
    @employee = Employee.find(params[:id])
  end
end
