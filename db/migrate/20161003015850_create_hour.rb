class CreateHour < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.string :restaurant_name, :hour_set_one, :hour_set_two, :hour_set_three, :hour_set_four, :hour_set_five
      t.text :restaurant_details, :restaurant_promotions
    end
  end
end
