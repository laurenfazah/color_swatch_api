class CreateColors < ActiveRecord::Migration[5.1]
  def change
    enable_extension('citext')
    create_table :colors do |t|
      t.citext :value

      t.timestamps
    end
  end
end
