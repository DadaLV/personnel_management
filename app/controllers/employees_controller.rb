class EmployeesController < ApplicationController
  before_action :set_department, only: [:index, :new]
  before_action :set_employee, only: [:edit, :update, :department_employees]

  def index
    if @department.present?
      @employees = @department.employees
    else
      @employees = Employee.all
    end
  end

  def show
    @employee = Employee.find(params[:id])
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
    @employee = Employee.find(params[:id])
  end

  def update
    if @employee.update(employee_params)
      flash[:notice] = "Position was successfully updated."
      redirect_to @employee, notice: 
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    flash[:notice] = "Employee was successfully destroyed."
    redirect_to employees_url
  end

  def department_employees
    if params[:department_id].present?
      @department = Department.find(params[:department_id])
      @employees = @department.employees
    else
      @employees = []
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
      @employee = @department.employees.find_by(id: params[:id])
    end
  end

  def employee_params
    params.require(:employee).permit(:first_name, :middle_name, :last_name, :passport_data, :date_of_birth, :place_of_birth, :home_address, :department_id)
  end
end