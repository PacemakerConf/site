class AddPositionAndDurationToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :duration, :datetime
  	add_column :events, :position, :integer
  end
end
