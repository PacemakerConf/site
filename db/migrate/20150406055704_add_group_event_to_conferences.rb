class AddGroupEventToConferences < ActiveRecord::Migration
  def change
  	add_column :conferences, :group_event, :boolean
  end
end
