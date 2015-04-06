class EventsController < ApplicationController

  def new
    @event = Event.new
    @event_types = EventType.where(speakerEvent: true)
    @invite = Invitation.where(email_hash: params[:hash])[0]
    @conference_name = Conference.find(@invite.conference_id).fullname
    @conference_id = @invite.conference_id
  end

  def create
    #authorize! :create, Event
    @event = Event.new(event_params)
    @invite = Invitation.where(email_hash: params['event']['email_hash'])[0]
    respond_to do |format|
      if @event.save
        @invite.status = 'Complete'
        @invite.save
        current_user = {'role' => User::SPEAKER}
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { redirect_to controller: 'events', action: 'new', hash: params['event']['email_hash'] }

        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
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

end