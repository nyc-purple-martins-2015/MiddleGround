class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, index: true
      # t.string :password_digest, null: false
      t.string :phone_number
      t.string :email
      t.string :uid
      t.string :avatar
      t.string :lat
      t.string :long
      # t.attachment :avatar, default: { "../../app/assets/images/default_pic.png" }

      t.timestamps null:false
    end
  end
end
