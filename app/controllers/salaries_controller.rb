# frozen_string_literal: true

class SalariesController < ApplicationController
  include Rails.application.routes.url_helpers

  before_action :set_user, only: %i[destroy show update]

  def index
    @salaries = Salary.includes(:employee, :particular).all
    render json: @salaries
  end

  def create
    @salary = Salary.new(salary_params)
    if @salary.save
      render json: @salary, status: :created
    else
      render json: @salary.errors, status: :unprocessable_entity
    end
  end

  def update
    if @salary.update(salary_params)
      render json: @salary
    else
      render json: @salary.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @salary
  end

  def destroy
    if @salary.destroy
      head :no_content
    else
      render json: @salary.errors, status: :unprocessable_entity
    end
  end

  private

  def salary_params
    params.permit(
      :status,
      :amount,
      :employee_id,
      :particular_id,
    )
  end

  def set_user
    @salary = Salary.find(params[:id])
  end
end
