class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, :location, :type, :time
      t.text :details
      t.date :date
    end
  end
end
