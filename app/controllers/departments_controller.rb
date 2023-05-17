class DepartmentsController < ApplicationController
  def index
    @departments = Department.all.includes(:employees)
  end
end