class CreateConstruction < ActiveRecord::Migration
  def change
    create_table :constructions do |t|
      t.string :location, :construction_type, :date_of_completion
      t.text :construction_details
      t.date :date_of_start
      t.boolean :archived, default: false
      t.timestamps null: false      
    end
  end
end
