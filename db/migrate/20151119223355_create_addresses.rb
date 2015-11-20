class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street, null:false
      t.string :type, null:false
      t.string :city
      t.integer :zip, null:false
      t.integer :user_id, null:false

      t.timestamps null:false
    end
  end
end
