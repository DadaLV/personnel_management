class EmployeePositionsController < ApplicationController
  before_action :set_employee

  def new
    @employee_position = @employee.employee_positions.new
  end

  def create
    position = Position.find_or_initialize_by(id: employee_position_params[:position_id])

  if position.new_record?
    position.name = "New Position"
    position.save
  end

    @employee_position = @employee.employee_positions.new(employee_position_params)

    if @employee_position.save
      flash[:notice] = "Position created successfully."
      redirect_to @employee
    else
      render :new
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def employee_position_params
    params.require(:employee_position).permit(:position_id)
  end
  
end