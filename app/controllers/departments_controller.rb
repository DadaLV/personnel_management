class DepartmentsController < ApplicationController
  include Draper::Decoratable
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
    
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)

    if @department.save
      flash[:notice] = I18n.t('.create.success')
      redirect_to @department
    else
      render :new
    end
  end

  def show
    @employees = @department.employees.decorate   
  end

  def edit    
  end

  def update
    if @department.update(department_params)
      flash[:notice] = I18n.t('.update.success')
      redirect_to @department
    else
      render :edit
    end    
  end

  def destroy
    @department.destroy
    flash[:notice] = I18n.t('.destroy.success')
    redirect_to departments_url
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name, :abbreviation)
  end

end