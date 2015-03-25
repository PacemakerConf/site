class RemoveReportsConfIdSpeakerEventInviteStatus < ActiveRecord::Migration
  def change
  	remove_column :reports, :conference_id
  	remove_column :invitations, :status
  	remove_column :event_types, :speakerEvent
  end
end
