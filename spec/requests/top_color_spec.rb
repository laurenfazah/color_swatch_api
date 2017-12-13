require "rails_helper"

RSpec.describe "Top color API" do
  describe "GET /api/v1/top_color" do
    it "returns a 200" do
      get api_v1_top_color_path

      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it "returns the most frequent color" do
      colors = %w(orange green yellow red green)
      colors.each do |color|
        Color.create(value: color)
      end

      get api_v1_top_color_path

      color = JSON.parse(response.body, symbolize_names: true)
      expect(color[:value]).to eq "green"
    end

    it "is case sensitive" do
      # we want students to downcase client-side
      colors = %w(orange Green yellow red green GREEN yellow)
      colors.each do |color|
        Color.create(value: color)
      end

      get api_v1_top_color_path

      color = JSON.parse(response.body, symbolize_names: true)
      expect(color[:value]).to eq     "yellow"
      expect(color[:value]).not_to eq "green"
    end
  end
end
