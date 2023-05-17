class EmployeesController < ApplicationController
  def index
    @department = Department.find(params[:department_id])
    @employees = @department.employees.limit(10)
  end
end