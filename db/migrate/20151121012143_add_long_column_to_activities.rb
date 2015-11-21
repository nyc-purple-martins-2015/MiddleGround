class AddLongColumnToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :long, :float
  end
end
