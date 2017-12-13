class Color < ApplicationRecord
  validates_presence_of :value

  def self.top
    select("colors.value, count(colors.value) AS color_count")
      .group(:value)
      .order("color_count DESC")
      .first
  end
end
