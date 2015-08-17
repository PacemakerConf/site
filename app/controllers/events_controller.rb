class EventsController < ApplicationController

  before_action :get_year!, only: [:year]

  def new
    @event = Event.new
    @event_types = EventType.where(speakerEvent: true)
    @invite = Invitation.find_by(email_hash: params[:hash])
    if @invite
      @conference_name = Conference.find(@invite.conference_id).fullname
      @conference_id = @invite.conference_id
    else
      @conference_name = ''
      @conference_id = ''
    end  
  end

  def create
    #authorize! :create, Event
    @event = Event.new(event_params)
    @invite = Invitation.find_by(email_hash: params['hash'])
    respond_to do |format|
      if @event.save
        @invite.update_attribute(:status, 'Complete')
        current_user = {'role' => User::SPEAKER}
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        @conference_id = @invite.conference_id
        @event_types = EventType.where(speakerEvent: true)
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def year
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])   
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:event_type_id, :speaker_id, :conference_id, :title, :description, :materials, :published, :duration)
  end

  def get_year!
    @year = Year.find_by(name: params[:year])
  end

end