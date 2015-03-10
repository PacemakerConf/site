class Admin::EventsController < Admin::ApplicationController
  before_action :authenticate_admin!
  before_action :set_event, only: [:publish, :show, :edit, :update, :destroy]

  layout 'admin'
  # GET /events
  # GET /events.json
  def index
    if(params[:conf_id])
      @events = Event.where(conference_id: params[:conf_id])
      @conference = Conference.find(params[:conf_id])
    else
      @events = Event.all
    end
    @speaker_event = EventType.where(speakerEvent: 1)
    @non_speaker_event = EventType.where(speakerEvent: 0)
    @speaker_events = @events.where(event_type: @speaker_event)
    @non_speaker_events = @events.where(event_type: @non_speaker_event)
  end

  def publish 
    @event.published = true
    @event.save!

    respond_to do |format|
      format.js {}
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @conference = Conference.find(event_params[:conference_id])
    position = Event.where(conference: @conference).size + 1
    @event.position = position
    respond_to do |format|
      if @event.save
        format.html { redirect_to schedule_admin_conference_path(@conference), notice: 'event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to [:admin, @event], notice: 'event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to admin_events_url, notice: 'event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /events/1/position?position=1
  def position
    @event = Event.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:published, :title, :description, :event_type_id, :conference_id, :speaker_id, :duration, :position, :responsable, :video, :materials)
    end
end
