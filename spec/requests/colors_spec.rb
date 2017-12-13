require 'rails_helper'

RSpec.describe "Colors resource" do
  describe "POST /api/v1/colors" do
    let(:color) { { color: { value: "tomato" } } }

    it "returns a 201" do
      post api_v1_colors_path, params: color

      expect(response.status).to eq 204
    end

    it "adds a color to the database" do
      expect do
       post api_v1_colors_path, params: color
     end.to change(Color, :count).by(1)
    end
  end
end
