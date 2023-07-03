class EmployeePositionsController < ApplicationController
  include Draper::Decoratable
  before_action :set_employee, only: [:create, :new, :update, :index, :show]
  before_action :set_employee_position, only: [:update]

  def index
    @employee_positions = @employee.employee_positions.decorate
  end

  def show
    
    @employee_positions = @employee.employee_positions
  end

  def new    
    @employee_position = @employee.employee_positions.new
  end

  def create
    employee_position = @employee.employee_positions.new(employee_position_params)

    if employee_position.save
      flash[:notice] = I18n.t('.create.success')
      redirect_to @employee
    else
      render :new
    end
  end

  def edit
    @employee_position = EmployeePosition.find(params[:id]) 
    @employee = @employee_position.employee
  end

  def update
    if @employee_position.update(employee_position_params)
      flash[:notice] = I18n.t('.update.success')
      redirect_to employee_path(@employee_position.employee)
    else
      flash.now[:alert] = "Error updating position."
      render :edit
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id] || params[:id])
  end

  def set_employee_position
    @employee_position = EmployeePosition.find_by(employee_id: params[:employee_id], id: params[:id])
    redirect_to edit_employee_position_path(@employee_position.employee, @employee_position), alert: 'Employee position not found' unless @employee_position
  end

  def employee_position_params
    params.require(:employee_position).permit(:position_id, :start_date, :end_date)
  end
  
end