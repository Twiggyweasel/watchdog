class CreateEvetype < ActiveRecord::Migration
  def change
    create_table :evetypes do |t|
      t.string :name
      t.timestamps null: false      
    end
  end
end
