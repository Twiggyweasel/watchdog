class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, :image, :gender, :weight, :height, :age
      t.text   :reason_short, :reason_detailed, :wearing
      t.boolean :cfa, default: false
      t.boolean :contact, default: false
      t.boolean :archived, default: false
      t.timestamps null: false
      t.references :incident, index: true, foreign_key: true      
    end
  end
end
