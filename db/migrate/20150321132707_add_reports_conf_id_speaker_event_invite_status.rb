class AddReportsConfIdSpeakerEventInviteStatus < ActiveRecord::Migration
  def change
   	add_column :reports, :conference_id, :integer
  	add_column :invitations, :status, :string
  	add_column :event_types, :speakerEvent, :boolean
  end
end
