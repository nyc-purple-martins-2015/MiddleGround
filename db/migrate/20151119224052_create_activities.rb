class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title, null:false
      t.string :location, null:false
      t.integer :creator_id, null:false
      t.integer :friend_id, null:false

      t.timestamps null:false
    end
  end
end
