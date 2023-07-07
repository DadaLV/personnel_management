class Api::V1::BaseController < ApplicationController
  private
  
  def render_errors(record)
    render json: { errors: record.errors.full_messages }, status: :unprocessable_entity
  end
end