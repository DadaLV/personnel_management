class EmployeesController < ApplicationController
  before_action :set_department
  before_action :set_employee, only: [:edit, :update, :department_employees]

  def index
    @employees = Employee.all 
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def department_employees
    @department = Department.find(params[:department_id])
    if @department
     @employees = @department.employees.limit(10)
    else
      flash[:notice] = "There is no department yet."
      redirect_to employees_path
    end
  end

  def new
    @employee = Employee.new
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

  private

  def set_department
    if params[:department_id].present?
      @department = Department.find(params[:department_id])
    else  
      @department = nil      
    end
  end

  def set_employee
    if @department.nil?
      @employee = nil
    else
      @employee = @department.employees.find_by(id: params[:employee_id])
    end
  end

  def employee_params
    params.require(:employee).permit(:first_name, :middle_name, :last_name, :passport_data, :date_of_birth, :place_of_birth, :home_address)
  end
end