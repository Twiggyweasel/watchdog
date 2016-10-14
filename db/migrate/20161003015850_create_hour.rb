class CreateHour < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.string :restaurant_name, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :secondary
      t.text :restaurant_details, :restaurant_promotions
    end
  end
end
