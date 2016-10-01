class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, :location, :event_type, :time
      t.text :details
      t.date :date
      t.timestamps null: false
    end
  end
end
