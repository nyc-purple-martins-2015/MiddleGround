class AddLatColumnToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :lat, :float
  end
end
