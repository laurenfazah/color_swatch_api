class Api::V1::TopColorController < ApplicationController
  def show
    @top_color = Color.top
    render json: @top_color, status: 200
  end
end
