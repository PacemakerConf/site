class RemoveContactIdFromLocation < ActiveRecord::Migration
  def change
  	remove_column :locations, :contact_id
  end
end
