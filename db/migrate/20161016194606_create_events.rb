class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :details
      t.date :date
      t.time :time
      t.timestamps null: false
      t.references :evetype, index: true, foreign_key: true      
      t.references :venue, index: true, foreign_key: true       
    end
  end
end
