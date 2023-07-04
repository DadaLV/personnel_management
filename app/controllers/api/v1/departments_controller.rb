class Api::V1::DepartmentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
    @departments = Department.all
    render json: @departments
  end

  # def new
  #   @department = Department.new
  # end

  def create
    @department = Department.new(department_params)

    if @department.save
      flash[:notice] = "Department was successfully created."
      render json: @department.to_json(only: [:id, :name, :abbreviation]), status: :created
    else
      render json: { errors: @department.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @department.to_json(only: [:id, :name, :abbreviation])
  end

  def edit    
  end

  def update
    if @department.update(department_params)
      render json: @department
    else
      render json: { errors: @employee.errors.full_messages }, status: :unprocessable_entity
    end    
  end

  def destroy
    @department.destroy
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name, :abbreviation)
  end

end