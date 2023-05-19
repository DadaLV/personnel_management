class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  def index
    @positions = Position.all
  end

  def show
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)
    if @position.save
      flash[:notice] = "Position was successfully created."
      redirect_to @position
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @position.update(position_params)
      flash[:notice] = "Position was successfully updated."
      redirect_to @position, notice: 
    else
      render :edit
    end
  end

  def destroy
    @position.destroy
    flash[:notice] = "Position was successfully destroyed."
    redirect_to positions_url
  end

  private

  def set_position
    @position = Position.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:name, :salary)
  end

end