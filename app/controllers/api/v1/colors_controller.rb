class Api::V1::ColorsController < ApplicationController
  def create
    Color.create(color_params)
  end

  private

  def color_params
    params.require(:color).permit(:value)
  end
end
