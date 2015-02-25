class RemoveLocationIdFromContact < ActiveRecord::Migration
  def change
  	remove_column :contacts, :location_id
  end
end
