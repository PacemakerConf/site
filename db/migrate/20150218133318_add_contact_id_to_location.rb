class AddContactIdToLocation < ActiveRecord::Migration
  def change
  	add_column :locations, :contact_id, :integer
  end
end
