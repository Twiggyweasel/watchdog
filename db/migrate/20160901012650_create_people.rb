class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, :image, :gender, :weight, :height, :incident_type
      t.text   :reason_short, :reason_detailed
      t.boolean :cfa, default: false
      t.boolean :contact, default: false
      t.boolean :archived, default: false
      t.timestamps null: false
    end
  end
end
