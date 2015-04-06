class AddGroupableBooleanToEventTypes < ActiveRecord::Migration
  def change
  	 add_column :event_types, :groupable, :boolean
  end
end
