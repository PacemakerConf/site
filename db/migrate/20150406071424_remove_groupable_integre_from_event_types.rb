class RemoveGroupableIntegreFromEventTypes < ActiveRecord::Migration
  def change
	remove_column :event_types, :groupable, :integer
  end
end
