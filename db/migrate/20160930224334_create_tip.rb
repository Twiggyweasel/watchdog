class CreateTip < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.text :totd
      t.boolean :archived, default: false
      t.timestamps null: false
    end
  end
end
