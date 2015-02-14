class AddPositionAndDurationToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :duration, :integer
  	add_column :events, :position, :integer
  end
end
