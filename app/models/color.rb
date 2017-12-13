class Color < ApplicationRecord
  validates_presence_of :value

  def self.top
    select("colors.value, count(colors.value) AS color_count")
      .group(:value)
      .order("color_count DESC")
      .first
  end

  def self.check_table_size
    if count > 2000
      Color.destroy_all
    end
  end
end
