class CreateDepartment < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.timestamp null: false
    end
  end
end
