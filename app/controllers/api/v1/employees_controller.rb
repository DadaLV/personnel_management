class Api::V1::EmployeesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_employee, only: [:show, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def show
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      render json: { status: :created }
    else
      render_errors(@employee)
    end
  end

  def edit    
  end

  def update
    if @employee.update(employee_params)
      render json: { status: :updated }
    else
      render_errors(@employee)
    end   
  end

  def destroy
    @employee.destroy
  end

  private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:first_name, :middle_name, :last_name, :passport_data, :date_of_birth, :place_of_birth, :home_address, :department_id)
    end
end
