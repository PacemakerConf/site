class ChangeSpeakerEventType < ActiveRecord::Migration
  def up
    change_column :event_types, :speakerEvent, :boolean
  end
end
