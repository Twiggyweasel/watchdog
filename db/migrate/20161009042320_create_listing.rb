class CreateListing < ActiveRecord::Migration
  def change
    create_table :listings do |t|
        t.string :location, :extension, :phone_number
        t.references :department, index: true, foreign_key: true        
        t.timestamps null: false
    end
  end
end
