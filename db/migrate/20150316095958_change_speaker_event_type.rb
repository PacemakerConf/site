class ChangeSpeakerEventType < ActiveRecord::Migration
  def up
    if ActiveRecord::Base.connection.column_exists?(:event_types, :speakerEvent)
      connection.execute(%q{
        alter table event_types
        alter column speakerEvent
        type integer using cast(speakerEvent as boolean)
      })
    else
      add_column :event_types, :speakerEvent, :boolean
    end
  end

  def down
    if ActiveRecord::Base.connection.column_exists?(:event_types, :speakerEvent)
      connection.execute(%q{
        alter table event_types
        alter column speakerEvent
        type integer using cast(speakerEvent as integer)
      })
    else
      add_column :event_types, :speakerEvent, :integer
    end
  end
end
