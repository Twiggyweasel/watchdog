class CreateClearance < ActiveRecord::Migration
  def change
    create_table :clearances do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
