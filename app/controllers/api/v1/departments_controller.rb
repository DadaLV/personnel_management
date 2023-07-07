class Api::V1::DepartmentsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
    @departments = Department.all
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      render json: { status: :created }
    else
      render_errors(@department)
    end
  end

  def show
  end

  def edit    
  end

  def update
    if @department.update(department_params)
      render json: { status: :updated }
    else
      render_errors(@department)
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