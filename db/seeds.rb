class Seed
   def self.run
 	   Color.destroy_all
     new.create_colors
   end

  def create_colors
    100.times do
      Color.create!(value: Faker::Color.color_name)
    end
  end
end

Seed.run
