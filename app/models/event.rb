class Event < ActiveRecord::Base
  require 'validators.rb'

  belongs_to :conference
  belongs_to :speaker
  belongs_to :event_type

  has_attached_file :materials,
    storage: :google_drive,
      google_drive_credentials: "#{Rails.root}/config/google_drive.yml",
      google_drive_options: {
        public_folder_id: '0BwGWoAkfcaADcW01NUY5SVR0dXc'
      }

  validates :title, presence: true
  validates :conference_id, presence: true
  validates :event_type_id, presence: true
  validates :duration, presence: true
  validates_with Validators::EventSpeakerValidator, on: [:create, :update]
  do_not_validate_attachment_file_type :materials

  scope :by_position, -> { order(position: :asc) }

  before_save :set_position
  
  def self.get_new_position conference_id
    return 0 unless conference_id
    positions = Event.where(conference_id: conference_id).pluck(:position).compact
    return 1 if positions.count == 0
    new_position = positions.max + 1    
  end

  def set_position
    self.position = self.class.get_new_position(self.conference_id) if self.position.nil?
  end  

  def duration_in_sec
    duration.to_i - duration.beginning_of_day.to_i
  end

  def self.change_position params
    position = params[:position].to_s.split(',')
      id = params[:id].to_s.split(',')
      begin
      if position.length == id.length
          for i in 1..id.length
            id_temp = id[i-1].to_i
            event_temp = Event.find(id_temp)
            event_temp.position = position[i-1]
            event_temp.save
          end
          return "Done" # Work with schedule.js ~90 line
        else
          return "Error: position and id length do not match."
        end
      rescue
          return "Error: Event change position don't work properly."
      end
  end

  def confirmation_message
    published? ? 'Are you sure? This event has been published.' : 'Are you sure?'
  end
end
