class ChangeSpeakerEventType < ActiveRecord::Migration
  def change
  	change_column :event_types, :speakerEvent, :boolean
  end
end
