class AddGroupableToEventTypes < ActiveRecord::Migration
 def change
 	add_column :event_types, :groupable, :integer
  end
end
