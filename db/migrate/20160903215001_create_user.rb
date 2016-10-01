class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :employee_num, :first_name, :last_name, :password_digest
      t.timestamps null: false
      t.references :clearance, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true
    end
  end
end
