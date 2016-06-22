class RenameDefaultDurationAndSpeakerEventColumnsInEventTypes < ActiveRecord::Migration
  def change
    rename_column :event_types, :defaultDuration, :default_duration
    rename_column :event_types, :speakerEvent, :speaker_event
  end
end
