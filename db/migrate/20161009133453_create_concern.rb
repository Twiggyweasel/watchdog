class CreateConcern < ActiveRecord::Migration
  def change
    create_table :concerns do |t|
      t.string :concern_name
      t.text :concern_description
      t.date :date_of_start
      t.boolean :archived
      t.timestamps null: false
      t.references :contypes, index: true, foreign_key: true
    end
  end
end
