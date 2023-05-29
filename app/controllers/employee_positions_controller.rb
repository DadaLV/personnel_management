class EmployeePositionsController < ApplicationController
  before_action :set_employee
  # before_action :set_employee_position, only: [:edit, :update]

  def new
    @employee_position = @employee.employee_positions.new
  end

  def create
    employee_position = @employee.employee_positions.new(employee_position_params)

    if employee_position.save
      flash[:notice] = "Position created successfully."
      redirect_to @employee
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   if @employee_position.update(employee_position_params)
  #     flash[:notice] = "Position updated successfully."
  #     redirect_to @employee_position.employee
  #   else
  #     render :edit
  #   end
  # end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  # def set_employee_position
  #   @employee_position = @employee.employee_positions.find(params[:id])  
  # end

  def employee_position_params
    params.require(:employee_position).permit(:position_id, :start_date, :end_date)
  end
  
end