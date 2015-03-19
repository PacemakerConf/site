class ChangeSpeakerEventType < ActiveRecord::Migration
  def change
  	change_column :event_types, :speakerEvent, 'boolean USING CAST(speakerEvent AS boolean)'
  end
end
