# frozen_string_literal: true

module Api
  class EmployeesController < ApplicationController
    before_action :set_user, only: %i[destroy show update]
    def index
      @employees = Employee.includes(:department, :manager, :customer).all
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
      if @employee.update(employee_params)
        render json: @employee
      else
        render json: @employee.errors, status: :unprocessable_entity
      end
    end

    def show
      render json: @employee
    end

    def destroy
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
        :manager_id,
        :customer_id,
        :salary_amount,
        :department_id,
      )
    end

    def set_user
      @employee = Employee.find(params[:id])
    end
  end
end
