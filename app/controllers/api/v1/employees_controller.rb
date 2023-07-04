class Api::V1::EmployeesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
    render json: @employees
  end

  def show
    render json: @employee.to_json(only: [:id, :first_name, :middle_name, :last_name, :passport_data, :date_of_birth, :place_of_birth, :home_address, :department_id])
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      render json: @employee.to_json(only: [:id, :first_name, :middle_name, :last_name, :passport_data, :date_of_birth, :place_of_birth, :home_address, :department_id]), status: :created
    else
      render json: { errors: @employee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @employee.update(employee_params)
      render json: @employee
    else
      render json: { errors: @employee.errors.full_messages }, status: :unprocessable_entity
    end   
  end

  def destroy
    @employee.destroy
  end

  private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:first_name, :middle_name, :last_name, :passport_data, :date_of_birth, :place_of_birth, :home_address, :department_id)
    end
end
