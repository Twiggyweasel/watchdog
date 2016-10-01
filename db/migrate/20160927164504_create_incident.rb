class CreateIncident < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :name
      t.timestamp null: false      
    end
  end
end
