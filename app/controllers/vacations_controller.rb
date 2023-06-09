class VacationsController < ApplicationController
  def index
    @vacations = Vacation.includes(:employee, :position).all
  end

end