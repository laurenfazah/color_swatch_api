class Api::V1::ColorsController < ApplicationController
  def create
    color = Color.new(color_params)
    if color.save
      render json: color, status: 201
    else
      render json: { message: color.errors.full_messages.join(", ") }
    end
  end

  private

  def color_params
    params.require(:color).permit(:value)
  end
end
