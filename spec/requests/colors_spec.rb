require 'rails_helper'

RSpec.describe "Colors resource" do
  describe "GET /api/v1/colors" do

    let(:color) { { color: { value: "tomato" } } }

    it "returns a 200" do
      get api_v1_colors_path
      expect(response.status).to eq 200
    end

    it "returns colors" do
      get api_v1_colors_path
      expect(JSON.parse(response.body)).to eq []

      post api_v1_colors_path, params: color

      get api_v1_colors_path
      color_response = JSON.parse(response.body, symbolize_names: true)
      expect(color_response[0][:value]).to eq "tomato"
    end
  end

  describe "POST /api/v1/colors" do
    let(:color) { { color: { value: "tomato" } } }

    it "returns a 201" do
      post api_v1_colors_path, params: color

      expect(response.status).to eq 201
    end

    it "adds a color to the database" do
      expect do
       post api_v1_colors_path, params: color
     end.to change(Color, :count).by(1)
    end
  end
end
