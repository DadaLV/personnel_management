class EmployeesController < ApplicationController
  
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  
  def index
    @department_id = params[:department_id]
    if params[:department_id].present?
      @department = Department.find(params[:department_id])
      @employees = @department.employees
    else
      @employees = Employee.all
    end
  end

  def show
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

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :middle_name, :last_name, :passport_data, :date_of_birth, :place_of_birth, :home_address, :department_id)
  end
end