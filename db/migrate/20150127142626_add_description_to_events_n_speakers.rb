class AddDescriptionToEventsNSpeakers < ActiveRecord::Migration
  def change
  	add_column :speakers, :description, :text
  	add_column :events, :description, :text
  end
end
