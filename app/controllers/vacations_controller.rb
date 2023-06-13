class VacationsController < ApplicationController
 
  def index
    @vacations = Vacation.includes(:employee, :position).all.paginate(page: params[:page], per_page: 10) 
  end

end