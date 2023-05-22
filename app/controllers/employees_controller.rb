class EmployeesController < ApplicationController
  before_action :set_department, only: [:index, :new, :department_employees]
  before_action :set_employee, only: [:edit, :update, :department_employees]
  before_action :set_employee_by_id, only: [:show, :destroy, :edit]

  def index
    @employees = @department.present? ? @department.employees : Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
    @employee.department_id = params[:department_id] if params[:department_id].present?
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:notice] = "Employee was successfully created."
      redirect_to @employee 
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      flash[:notice] = "Position was successfully updated."
      redirect_to @employee
    else
      render :edit
    end
  end

  def destroy
    @employee.destroy
    flash[:notice] = "Employee was successfully destroyed."
    redirect_to employees_url
  end

  def department_employees
    @employees = params[:department_id].present? ? @department&.employees : []
  end

  private

  def set_employee_by_id
    @employee = Employee.find(params[:id])
  end

  def set_department
    @department = params[:department_id].present? ? Department.find(params[:department_id]) : nil
  end

  def set_employee
    @employee = @department&.employees&.find_by(id: params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :middle_name, :last_name, :passport_data, :date_of_birth, :place_of_birth, :home_address, :department_id)
  end
end