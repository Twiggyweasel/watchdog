class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, :access, :password_digest
      
    end
  end
end
